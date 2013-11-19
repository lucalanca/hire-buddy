$(function() {
	function handleClickedDataToCoupon(e, dataAttributes, couponFieldQuery, hiddenInputQuery, hiddenInputKey, visibleNodeQuery, visibleNodeKey) {
		var currentTarget = e.currentTarget
			, couponField = $('.dinamic-field-container'+ couponFieldQuery)
			, hiddenInput = hiddenInputQuery ? couponField.children(hiddenInputQuery) : null
			, visibleNode = visibleNodeQuery ? couponField.children(visibleNodeQuery) : null
			, data = {}
			, nextCouponField = couponField.next('.dinamic-field-container')
			;

		

		// for (var key in dataAttributes) {
		// 	data[key] = $(e.currentTarget).data(dataAttributes[key.replace(/([a-z])([A-Z])/g, '$1-$2').toLowerCase()]);
		// }

		if (hiddenInput) {
			hiddenInput.val(dataAttributes[hiddenInputKey]);	
		}

		if (visibleNode) {
			visibleNode.text(dataAttributes[visibleNodeKey]);
		}


		if (nextCouponField.length) {
			couponField.removeClass('focused').next('.dinamic-field-container').addClass('focused');	
		} else {
			couponField.removeClass('focused').next('.actions').find('.submit-btn').removeClass('c1').addClass('c4').val('New Interview');
		}
		
		// TODO: SELECT BUTTON
	}

	function interviewForm () {
		var dataContainers = $('.modal-form-data-container'),
			focusedDataContainer = $('.modal-form-data-container.focused'),
			modalForm = $('.new-interview-form'),
			formFields = modalForm.find('.dinamic-field-container')
			fieldsIds = formFields.map(function (index, field) {
				return $(field).data('field');
			})
			;

			// attach click event listeners to dataContainers
			dataContainers.each(function (index, container) {
				var itemQuery = $(container).data('item-query'),
					formFieldQuery = $(container).data('form-field-query'),
					hiddenInputKey = $(container).data('hidden-input-key'),
					fieldPlaceholder = $(container).data('field-placeholder')
					;

				$(itemQuery).click( function (e) {
					var itemDataAttributes = $(e.currentTarget).data();
					handleClickedDataToCoupon(e, itemDataAttributes, formFieldQuery, '.hiddenInput', hiddenInputKey, '.field-placeholder', fieldPlaceholder);
					if ($(container).hasClass('focused')) {
						$(container).hide({
							complete: function () {
								$(this).removeClass('focused');
							}
						});
						$(container).next('.modal-form-data-container').show({
							complete: function () {
								$(this).addClass('focused');		
							}
						});
					}
				});
			});
	}

	// $('.candidate-list .candidate').click( function (e) {
	// 	handleClickedDataToCoupon(e, { id: 'candidate-id', name: 'candidate-name'}, '.candidate-id', '.hiddenInput', 'id', '.field-placeholder', 'name');
	// });

	// $('.interviewer-list .interviewer').click( function (e) {
	// 	handleClickedDataToCoupon(e, { id: 'candidate-id', name: 'candidate-name'}, '.interviewer-id', '.hiddenInput', 'id', '.field-placeholder', 'name');
	// });

	// $('.position-list .position').click( function (e) {
	// 	handleClickedDataToCoupon(e, { position: 'position' }, '.position', '.hiddenInput', 'position', '.field-placeholder', 'position')
	// });

	interviewForm();

});