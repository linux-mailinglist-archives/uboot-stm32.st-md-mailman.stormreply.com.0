Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B57F48F609
	for <lists+uboot-stm32@lfdr.de>; Sat, 15 Jan 2022 10:03:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB7A2C60461;
	Sat, 15 Jan 2022 09:03:46 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8220C5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jan 2022 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642237422;
 bh=hVpjV/yEJcR/rRQxl+GmJ6K6qFnskEqLQDbnKFFChP0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YbKMjMYta1l11W9OAzIoa9d6fW0ngPLNd8GuDBqnDg3mn48eQbcZ8zScKfWZL1ssk
 4cQd0M1GqpccgxpqqM7s/iL4z0eXkwe8ENWbGVTTE+0Zq/yQHOllveVTjxdsoyA+1F
 tntoodjkioyfNcGaTC4fr1DuQT3MtmMQvcnJI2UA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.94] ([88.152.144.107]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MybKp-1mPltD07Nl-00z1Tm; Sat, 15
 Jan 2022 10:03:42 +0100
Message-ID: <85e2b043-4596-e1ef-5f77-d827552ae6ce@gmx.de>
Date: Sat, 15 Jan 2022 10:03:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
 <20220112105327.5.I95ad2c0a8de00ea765dba1c59eb7b758b4c2351e@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20220112105327.5.I95ad2c0a8de00ea765dba1c59eb7b758b4c2351e@changeid>
X-Provags-ID: V03:K1:/n2VOiTf5shke4VQbusFFxgDk8Oq6SF3qrwgaXX2qKMxtrb8dce
 cFKQNr45tcoceVLXS5RxIS4/E3t+NdD/+5u/oYaXbdvrvMPtzHENqcNm1AJFVsm53fDWogI
 KzmB1JQUne54yYe4LmOhVlCUMMq1/OszlhotMzausjS5hGvR5mbBc1sIf9oC6nAT8QWWKtZ
 yrCgLVHvmaoPHlAPeBHAw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i4wkXgNROT4=:N4QkD2XfhWiCSbLng3pooO
 h8jjD/UHaAydC7RDEb0cfupoiy6AhcmSa3vyMYAUkJ37UM1Snkk31zXtAGHMc95UlwYVZSj4T
 6Pd3wXtZ9fD/vj7Y8y1NEPlk5SfVk4UuZOXLX0EG4BJb6qGPO/YIB76ea82PE1aD54yEqUlww
 aoM7NN12IcDZZUbdZZROtYy0HIGFdhfjHhwCeAuOmOAnnzXm/CmoXdrLJWm/+PAIm0Mo02w6g
 xb1aiu/KTeb6FpNDvwQhPHpuk0TZ7wl7hYr6pw72elCrDvi81lh3W3ws7GWFw2onbnDYRhT1B
 yXmXpDofOf3jFyTDput3zj3GnAYXjAoB+WjaN+1OGV4DjZ4Rurh8pTaUuxGDpyML4M9Q95SK+
 muZeX3mbuY3r/xcSpJowIw70aKKF2A3zSrTxXEToH7gotHKZkqiaVb+rKenRvOoI33gaxDbK/
 ach+DBaOzTprH3X0kgUA15xJg/7Mad7tdJ+6ErW06sUoug1qykAe8zHSw1bNGCus6UwcCQXeg
 wShvvGCN48ObUpTJG8HlREOKOrKmidpTn8ZoXmwsb9y+WUOKkO9PUEXEg20kuZHzxjuo6CGcs
 4rCkzlwftCa/no5z74mo52m1pCv4XuBfeeeePLn0ZcJw02Qxm1+UfBUI/GO3bWNSEb8PiDCa1
 hqX8nDiCGmLMvlB4oOmpuNbip9zruUaeYD5Sqsq9OEtwni7G+HRUXjAG3Xx/sLr4GQshpiJ0P
 /IJTJANif9SA5YXXOhgqWWR4S68mrzT7eYTk/P1iL77NQ0scYoyE7CLw51YIOXvU26kM3XRYi
 /WOI0VEyGeMENGyqi8xxfeOGXjjj3ReSCT/xwsFLzFXqnYzRgoblyBnGRqoFHJLRdxyAB+50Z
 qqXqPhREJvuc992/qTtY+ruZo80Doc6rl5G8TmGj/IUuxO5Y6/i4xOPtuySKWCSa68EEVnhhJ
 0v63npsBdTTZWYThVwAgGdCzbMwAJ5x1gQBBUyJtZ2dEYqW4+IfifoXAfnX1F82I/1LUBFLts
 CNbVtknY3zjPSPWyP6AfceVNc8UJ6H2yNnIQfMKriXJN135EpjmXzWJ99O20VP+fA/MLhnyTj
 YvmCDUyedKbxg8=
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 5/9] doc: add include/dm/device.h to the
 HTML documentation
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 1/12/22 10:53, Patrick Delaunay wrote:
> Correct Sphinx style comments in include/dm/device.h
> and add the driver model device API to the HTML documentation.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   doc/api/dm.rst      |   5 ++
>   include/dm/device.h | 209 ++++++++++++++++++++++++--------------------
>   2 files changed, 121 insertions(+), 93 deletions(-)
>
> diff --git a/doc/api/dm.rst b/doc/api/dm.rst
> index 6f72b0b620..7a77a91c1f 100644
> --- a/doc/api/dm.rst
> +++ b/doc/api/dm.rst
> @@ -10,3 +10,8 @@ Uclass and Driver
>   .. kernel-doc:: include/dm/root.h
>   .. kernel-doc:: include/dm/lists.h
>   .. kernel-doc:: include/dm/platdata.h
> +
> +Device
> +------
> +
> +.. kernel-doc:: include/dm/device.h
> diff --git a/include/dm/device.h b/include/dm/device.h
> index cf785f7ae2..bc8da72b50 100644
> --- a/include/dm/device.h
> +++ b/include/dm/device.h
> @@ -145,7 +145,7 @@ enum {
>    * @uclass_node: Used by uclass to link its devices
>    * @child_head: List of children of this device
>    * @sibling_node: Next device in list of all devices
> - * @flags_: Flags for this device DM_FLAG_... (do not access outside driver
> + * @flags_: Flags for this device `DM_FLAG_...` (do not access outside driver
>    *	model)
>    * @seq_: Allocated sequence number for this device (-1 = none). This is set up
>    * when the device is bound and is unique within the device's uclass. If the
> @@ -193,14 +193,14 @@ struct udevice {
>   };
>
>   /**
> - * udevice_rt - runtime information set up by U-Boot
> + * struct udevice_rt - runtime information set up by U-Boot
>    *
>    * This is only used with OF_PLATDATA_RT
>    *
>    * There is one of these for every udevice in the linker list, indexed by
>    * the udevice_info idx value.
>    *
> - * @flags_: Flags for this device DM_FLAG_... (do not access outside driver
> + * @flags_: Flags for this device `DM_FLAG_...` (do not access outside driver
>    *	model)
>    */
>   struct udevice_rt {
> @@ -239,7 +239,7 @@ static inline void dev_bic_flags(struct udevice *dev, u32 bic)
>    * dev_ofnode() - get the DT node reference associated with a udevice
>    *
>    * @dev:	device to check
> - * @return reference of the the device's DT node
> + * Return: reference of the device's DT node
>    */
>   static inline ofnode dev_ofnode(const struct udevice *dev)
>   {
> @@ -351,7 +351,7 @@ struct udevice_id {
>    * @ops: Driver-specific operations. This is typically a list of function
>    * pointers defined by the driver, to implement driver functions required by
>    * the uclass.
> - * @flags: driver flags - see DM_FLAGS_...
> + * @flags: driver flags - see `DM_FLAGS_...`
>    * @acpi_ops: Advanced Configuration and Power Interface (ACPI) operations,
>    * allowing the device to add things to the ACPI tables passed to Linux
>    */
> @@ -378,11 +378,24 @@ struct driver {
>   #endif
>   };
>
> -/* Declare a new U-Boot driver */
> +/**
> + * U_BOOT_DRIVER() - Declare a new U-Boot driver
> + * @__name: name of the driver
> + */
>   #define U_BOOT_DRIVER(__name)						\
>   	ll_entry_declare(struct driver, __name, driver)
>
> -/* Get a pointer to a given driver */
> +/**
> + * DM_DRIVER_GET() - Get a pointer to a given driver
> + *
> + * This is useful in code for referencing a driver at build time.
> + * Before this is used, an extern U_BOOT_DRIVER() must have been
> + * declared.
> + *
> + * @__name:	Name of the driver. This must be a valid C identifier,
> + * used by the linker_list
> + * Return: struct driver * for the driver
> + */
>   #define DM_DRIVER_GET(__name)						\
>   	ll_entry_get(struct driver, __name, driver)
>
> @@ -392,60 +405,69 @@ struct driver {
>    * This is useful in data structures and code for referencing a driver at
>    * build time. Before this is used, an extern U_BOOT_DRIVER() must have been
>    * declared.
> + * This is like DM_DRIVER_GET, but without the extra code, so it is suitable
> + * for putting into data structures.
>    *
> - * For example:
> - *
> - * extern U_BOOT_DRIVER(sandbox_fixed_clock);
> + * For example: ::
>    *
> - * struct driver *drvs[] = {
> - *	DM_DRIVER_REF(sandbox_fixed_clock),
> - * };
> + *   extern U_BOOT_DRIVER(sandbox_fixed_clock);
> + *   struct driver *drvs[] = {
> + *       DM_DRIVER_REF(sandbox_fixed_clock),
> + *   };
>    *
> - * @_name: Name of the driver. This must be a valid C identifier, used by the
> - *	linker_list
> - * @returns struct driver * for the driver
> + * @_name:	Name of the driver. This must be a valid C identifier,
> + * used by the linker_list
> + * Return: struct driver * for the driver
>    */
>   #define DM_DRIVER_REF(_name)					\
>   	ll_entry_ref(struct driver, _name, driver)
>
>   /**
> - * Declare a macro to state a alias for a driver name. This macro will

nits:
%s/a alias/an alias/

> - * produce no code but its information will be parsed by tools like
> - * dtoc
> + * DM_DRIVER_ALIAS() - Declare a macro to state a alias for a driver name
> + *
> + * This macro will produce no code but its information will be parsed by tools
> + * like dtoc
> + *
> + * @__name:	name of driver
> + * @__alias:	alias for the driver name
>    */
>   #define DM_DRIVER_ALIAS(__name, __alias)
>
>   /**
> - * Declare a macro to indicate which phase of U-Boot this driver is fore.
> - *
> + * DM_PHASE() - Declare a macro to indicate which phase of U-Boot this driver is fore.

%s/fore\./for/

Will correct when merging.

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

>    *
>    * This macro produces no code but its information will be parsed by dtoc. The
>    * macro can be only be used once in a driver. Put it within the U_BOOT_DRIVER()
> - * declaration, e.g.:
> + * declaration, e.g.: ::
> + *
> + *   U_BOOT_DRIVER(cpu) = {
> + *       .name = ...
> + *       ...
> + *       DM_PHASE(tpl)
> + *   };
>    *
> - * U_BOOT_DRIVER(cpu) = {
> - *	.name = ...
> - *	...
> - *	DM_PHASE(tpl)
> - * };
> + * @_phase:	Associated phase of U-Boot ("spl", "tpl")
>    */
>   #define DM_PHASE(_phase)
>
>   /**
> - * Declare a macro to declare a header needed for a driver. Often the correct
> - * header can be found automatically, but only for struct declarations. For
> - * enums and #defines used in the driver declaration and declared in a different
> - * header from the structs, this macro must be used.
> + * DM_HEADER() - Declare a macro to declare a header needed for a driver.
> + *
> + * Often the correct header can be found automatically, but only for struct
> + * declarations. For enums and #defines used in the driver declaration and
> + * declared in a different header from the structs, this macro must be used.
>    *
>    * This macro produces no code but its information will be parsed by dtoc. The
>    * macro can be used multiple times with different headers, for the same driver.
> - * Put it within the U_BOOT_DRIVER() declaration, e.g.:
> + * Put it within the U_BOOT_DRIVER() declaration, e.g.: ::
> + *
> + *   U_BOOT_DRIVER(cpu) = {
> + *       .name = ...
> + *       ...
> + *       DM_HEADER(<asm/cpu.h>)
> + *   };
>    *
> - * U_BOOT_DRIVER(cpu) = {
> - *	.name = ...
> - *	...
> - *	DM_HEADER(<asm/cpu.h>)
> - * };
> + * @_hdr:	header needed for a driver
>    */
>   #define DM_HEADER(_hdr)
>
> @@ -454,8 +476,8 @@ struct driver {
>    *
>    * This checks that dev is not NULL, but no other checks for now
>    *
> - * @dev		Device to check
> - * @return platform data, or NULL if none
> + * @dev:	Device to check
> + * Return: platform data, or NULL if none
>    */
>   void *dev_get_plat(const struct udevice *dev);
>
> @@ -464,8 +486,8 @@ void *dev_get_plat(const struct udevice *dev);
>    *
>    * This checks that dev is not NULL, but no other checks for now
>    *
> - * @dev		Device to check
> - * @return parent's platform data, or NULL if none
> + * @dev:	Device to check
> + * Return: parent's platform data, or NULL if none
>    */
>   void *dev_get_parent_plat(const struct udevice *dev);
>
> @@ -474,8 +496,8 @@ void *dev_get_parent_plat(const struct udevice *dev);
>    *
>    * This checks that dev is not NULL, but no other checks for now
>    *
> - * @dev		Device to check
> - * @return uclass's platform data, or NULL if none
> + * @dev:	Device to check
> + * Return: uclass's platform data, or NULL if none
>    */
>   void *dev_get_uclass_plat(const struct udevice *dev);
>
> @@ -484,8 +506,8 @@ void *dev_get_uclass_plat(const struct udevice *dev);
>    *
>    * This checks that dev is not NULL, but no other checks for now
>    *
> - * @dev		Device to check
> - * @return private data, or NULL if none
> + * @dev:	Device to check
> + * Return: private data, or NULL if none
>    */
>   void *dev_get_priv(const struct udevice *dev);
>
> @@ -498,8 +520,8 @@ void *dev_get_priv(const struct udevice *dev);
>    *
>    * This checks that dev is not NULL, but no other checks for now
>    *
> - * @dev		Device to check
> - * @return parent data, or NULL if none
> + * @dev:	Device to check
> + * Return: parent data, or NULL if none
>    */
>   void *dev_get_parent_priv(const struct udevice *dev);
>
> @@ -508,16 +530,16 @@ void *dev_get_parent_priv(const struct udevice *dev);
>    *
>    * This checks that dev is not NULL, but no other checks for now
>    *
> - * @dev		Device to check
> - * @return private uclass data for this device, or NULL if none
> + * @dev:	Device to check
> + * Return: private uclass data for this device, or NULL if none
>    */
>   void *dev_get_uclass_priv(const struct udevice *dev);
>
>   /**
> - * struct dev_get_parent() - Get the parent of a device
> + * dev_get_parent() - Get the parent of a device
>    *
>    * @child:	Child to check
> - * @return parent of child, or NULL if this is the root device
> + * Return: parent of child, or NULL if this is the root device
>    */
>   struct udevice *dev_get_parent(const struct udevice *child);
>
> @@ -529,13 +551,14 @@ struct udevice *dev_get_parent(const struct udevice *child);
>    * returns the associated data value for that compatible string. This is
>    * the 'data' field in struct udevice_id.
>    *
> - * As an example, consider this structure:
> - * static const struct udevice_id tegra_i2c_ids[] = {
> - *	{ .compatible = "nvidia,tegra114-i2c", .data = TYPE_114 },
> - *	{ .compatible = "nvidia,tegra20-i2c", .data = TYPE_STD },
> - *	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = TYPE_DVC },
> - *	{ }
> - * };
> + * As an example, consider this structure: ::
> + *
> + *  static const struct udevice_id tegra_i2c_ids[] = {
> + *      { .compatible = "nvidia,tegra114-i2c", .data = TYPE_114 },
> + *      { .compatible = "nvidia,tegra20-i2c", .data = TYPE_STD },
> + *      { .compatible = "nvidia,tegra20-i2c-dvc", .data = TYPE_DVC },
> + *      { }
> + *  };
>    *
>    * When driver model finds a driver for this it will store the 'data' value
>    * corresponding to the compatible string it matches. This function returns
> @@ -544,7 +567,7 @@ struct udevice *dev_get_parent(const struct udevice *child);
>    * For USB devices, this is the driver_info field in struct usb_device_id.
>    *
>    * @dev:	Device to check
> - * @return driver data (0 if none is provided)
> + * Return: driver data (0 if none is provided)
>    */
>   ulong dev_get_driver_data(const struct udevice *dev);
>
> @@ -555,7 +578,7 @@ ulong dev_get_driver_data(const struct udevice *dev);
>    * driver's operations.
>    *
>    * @dev:	Device to check
> - * @return void pointer to driver's operations or NULL for NULL-dev or NULL-ops
> + * Return: void pointer to driver's operations or NULL for NULL-dev or NULL-ops
>    */
>   const void *dev_get_driver_ops(const struct udevice *dev);
>
> @@ -563,7 +586,7 @@ const void *dev_get_driver_ops(const struct udevice *dev);
>    * device_get_uclass_id() - return the uclass ID of a device
>    *
>    * @dev:	Device to check
> - * @return uclass ID for the device
> + * Return: uclass ID for the device
>    */
>   enum uclass_id device_get_uclass_id(const struct udevice *dev);
>
> @@ -573,7 +596,7 @@ enum uclass_id device_get_uclass_id(const struct udevice *dev);
>    * This checks that dev is not NULL.
>    *
>    * @dev:	Device to check
> - * @return  pointer to the uclass name for the device
> + * Return:  pointer to the uclass name for the device
>    */
>   const char *dev_get_uclass_name(const struct udevice *dev);
>
> @@ -583,11 +606,11 @@ const char *dev_get_uclass_name(const struct udevice *dev);
>    * Returns the numbered child, 0 being the first. This does not use
>    * sequence numbers, only the natural order.
>    *
> - * @dev:	Parent device to check
> + * @parent:	Parent device to check
>    * @index:	Child index
>    * @devp:	Returns pointer to device
> - * @return 0 if OK, -ENODEV if no such device, other error if the device fails
> - *	   to probe
> + * Return:
> + * 0 if OK, -ENODEV if no such device, other error if the device fails to probe
>    */
>   int device_get_child(const struct udevice *parent, int index,
>   		     struct udevice **devp);
> @@ -619,7 +642,7 @@ int device_get_decendent_count(const struct udevice *parent);
>    * @seq: Sequence number to find (0=first)
>    * @devp: Returns pointer to device (there is only one per for each seq).
>    * Set to NULL if none is found
> - * @return 0 if OK, -ENODEV if not found
> + * Return: 0 if OK, -ENODEV if not found
>    */
>   int device_find_child_by_seq(const struct udevice *parent, int seq,
>   			     struct udevice **devp);
> @@ -637,7 +660,7 @@ int device_find_child_by_seq(const struct udevice *parent, int seq,
>    * @seq: Sequence number to find (0=first)
>    * @devp: Returns pointer to device (there is only one per for each seq)
>    * Set to NULL if none is found
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int device_get_child_by_seq(const struct udevice *parent, int seq,
>   			    struct udevice **devp);
> @@ -650,7 +673,7 @@ int device_get_child_by_seq(const struct udevice *parent, int seq,
>    * @parent: Parent device
>    * @of_offset: Device tree offset to find
>    * @devp: Returns pointer to device if found, otherwise this is set to NULL
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int device_find_child_by_of_offset(const struct udevice *parent, int of_offset,
>   				   struct udevice **devp);
> @@ -665,7 +688,7 @@ int device_find_child_by_of_offset(const struct udevice *parent, int of_offset,
>    * @parent: Parent device
>    * @of_offset: Device tree offset to find
>    * @devp: Returns pointer to device if found, otherwise this is set to NULL
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int device_get_child_by_of_offset(const struct udevice *parent, int of_offset,
>   				  struct udevice **devp);
> @@ -680,7 +703,7 @@ int device_get_child_by_of_offset(const struct udevice *parent, int of_offset,
>    *
>    * @node: Device tree ofnode to find
>    * @devp: Returns pointer to device if found, otherwise this is set to NULL
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>
>   int device_find_global_by_ofnode(ofnode node, struct udevice **devp);
> @@ -695,7 +718,7 @@ int device_find_global_by_ofnode(ofnode node, struct udevice **devp);
>    *
>    * @node: Device tree ofnode to find
>    * @devp: Returns pointer to device if found, otherwise this is set to NULL
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int device_get_global_by_ofnode(ofnode node, struct udevice **devp);
>
> @@ -715,7 +738,7 @@ int device_get_global_by_ofnode(ofnode node, struct udevice **devp);
>    *
>    * @idx: Index number of the driver_info/udevice structure (0=first)
>    * @devp: Returns pointer to device if found, otherwise this is set to NULL
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int device_get_by_ofplat_idx(uint idx, struct udevice **devp);
>
> @@ -724,7 +747,7 @@ int device_get_by_ofplat_idx(uint idx, struct udevice **devp);
>    *
>    * @parent: Parent device to search
>    * @devp: Returns first child device, or NULL if none
> - * @return 0
> + * Return: 0
>    */
>   int device_find_first_child(const struct udevice *parent,
>   			    struct udevice **devp);
> @@ -734,7 +757,7 @@ int device_find_first_child(const struct udevice *parent,
>    *
>    * @devp: Pointer to previous child device on entry. Returns pointer to next
>    *		child device, or NULL if none
> - * @return 0
> + * Return: 0
>    */
>   int device_find_next_child(struct udevice **devp);
>
> @@ -749,7 +772,7 @@ int device_find_next_child(struct udevice **devp);
>    * @parent:	Parent device to search
>    * @uclass_id:	Uclass to look for
>    * @devp:	Returns device found, if any, else NULL
> - * @return 0 if found, else -ENODEV
> + * Return: 0 if found, else -ENODEV
>    */
>   int device_find_first_inactive_child(const struct udevice *parent,
>   				     enum uclass_id uclass_id,
> @@ -761,7 +784,7 @@ int device_find_first_inactive_child(const struct udevice *parent,
>    * @parent: Parent device to search
>    * @uclass_id:	Uclass to look for
>    * @devp: Returns first child device in that uclass, if any, else NULL
> - * @return 0 if found, else -ENODEV
> + * Return: 0 if found, else -ENODEV
>    */
>   int device_find_first_child_by_uclass(const struct udevice *parent,
>   				      enum uclass_id uclass_id,
> @@ -774,7 +797,7 @@ int device_find_first_child_by_uclass(const struct udevice *parent,
>    * @name:	Name to look for
>    * @len:	Length of the name
>    * @devp:	Returns device found, if any
> - * @return 0 if found, else -ENODEV
> + * Return: 0 if found, else -ENODEV
>    */
>   int device_find_child_by_namelen(const struct udevice *parent, const char *name,
>   				 int len, struct udevice **devp);
> @@ -785,7 +808,7 @@ int device_find_child_by_namelen(const struct udevice *parent, const char *name,
>    * @parent:	Parent device to search
>    * @name:	Name to look for
>    * @devp:	Returns device found, if any
> - * @return 0 if found, else -ENODEV
> + * Return: 0 if found, else -ENODEV
>    */
>   int device_find_child_by_name(const struct udevice *parent, const char *name,
>   			      struct udevice **devp);
> @@ -798,7 +821,7 @@ int device_find_child_by_name(const struct udevice *parent, const char *name,
>    *
>    * @parent: Parent to check
>    * @devp: Returns child that was found, if any
> - * @return 0 on success, -ENODEV if no children, other -ve on error
> + * Return: 0 on success, -ENODEV if no children, other -ve on error
>    */
>   int device_first_child_ofdata_err(struct udevice *parent,
>   				  struct udevice **devp);
> @@ -811,7 +834,7 @@ int device_first_child_ofdata_err(struct udevice *parent,
>    *
>    * @devp: On entry, points to the previous child; on exit returns the child that
>    *	was found, if any
> - * @return 0 on success, -ENODEV if no children, other -ve on error
> + * Return: 0 on success, -ENODEV if no children, other -ve on error
>    */
>   int device_next_child_ofdata_err(struct udevice **devp);
>
> @@ -822,7 +845,7 @@ int device_next_child_ofdata_err(struct udevice **devp);
>    *
>    * @parent:	Parent device to search
>    * @devp:	Returns device found, if any
> - * @return 0 if found, -ENODEV if not, -ve error if device failed to probe
> + * Return: 0 if found, -ENODEV if not, -ve error if device failed to probe
>    */
>   int device_first_child_err(struct udevice *parent, struct udevice **devp);
>
> @@ -833,7 +856,7 @@ int device_first_child_err(struct udevice *parent, struct udevice **devp);
>    *
>    * @devp: On entry, pointer to device to lookup. On exit, returns pointer
>    * to the next sibling if no error occurred
> - * @return 0 if found, -ENODEV if not, -ve error if device failed to probe
> + * Return: 0 if found, -ENODEV if not, -ve error if device failed to probe
>    */
>   int device_next_child_err(struct udevice **devp);
>
> @@ -841,7 +864,7 @@ int device_next_child_err(struct udevice **devp);
>    * device_has_children() - check if a device has any children
>    *
>    * @dev:	Device to check
> - * @return true if the device has one or more children
> + * Return: true if the device has one or more children
>    */
>   bool device_has_children(const struct udevice *dev);
>
> @@ -849,7 +872,7 @@ bool device_has_children(const struct udevice *dev);
>    * device_has_active_children() - check if a device has any active children
>    *
>    * @dev:	Device to check
> - * @return true if the device has one or more children and at least one of
> + * Return: true if the device has one or more children and at least one of
>    * them is active (probed).
>    */
>   bool device_has_active_children(const struct udevice *dev);
> @@ -862,7 +885,7 @@ bool device_has_active_children(const struct udevice *dev);
>    * view of devices is being displayed.
>    *
>    * @dev:	Device to check
> - * @return true if there are no more siblings after this one - i.e. is it
> + * Return: true if there are no more siblings after this one - i.e. is it
>    * last in the list.
>    */
>   bool device_is_last_sibling(const struct udevice *dev);
> @@ -880,7 +903,7 @@ bool device_is_last_sibling(const struct udevice *dev);
>    * @dev:	Device to update
>    * @name:	New name (this string is allocated new memory and attached to
>    *		the device)
> - * @return 0 if OK, -ENOMEM if there is not enough memory to allocate the
> + * Return: 0 if OK, -ENOMEM if there is not enough memory to allocate the
>    * string
>    */
>   int device_set_name(struct udevice *dev, const char *name);
> @@ -903,7 +926,7 @@ void device_set_name_alloced(struct udevice *dev);
>    * @dev:	udevice pointer for which compatible needs to be verified.
>    * @compat:	Compatible string which needs to verified in the given
>    *		device
> - * @return true if OK, false if the compatible is not found
> + * Return: true if OK, false if the compatible is not found
>    */
>   bool device_is_compatible(const struct udevice *dev, const char *compat);
>
> @@ -914,7 +937,7 @@ bool device_is_compatible(const struct udevice *dev, const char *compat);
>    * This allows to check whether the machine is comaptible with the compat.
>    *
>    * @compat:	Compatible string which needs to verified
> - * @return true if OK, false if the compatible is not found
> + * Return: true if OK, false if the compatible is not found
>    */
>   bool of_machine_is_compatible(const char *compat);
>
> @@ -922,7 +945,7 @@ bool of_machine_is_compatible(const char *compat);
>    * dev_disable_by_path() - Disable a device given its device tree path
>    *
>    * @path:	The device tree path identifying the device to be disabled
> - * @return 0 on success, -ve on error
> + * Return: 0 on success, -ve on error
>    */
>   int dev_disable_by_path(const char *path);
>
> @@ -930,7 +953,7 @@ int dev_disable_by_path(const char *path);
>    * dev_enable_by_path() - Enable a device given its device tree path
>    *
>    * @path:	The device tree path identifying the device to be enabled
> - * @return 0 on success, -ve on error
> + * Return: 0 on success, -ve on error
>    */
>   int dev_enable_by_path(const char *path);
>
> @@ -938,7 +961,7 @@ int dev_enable_by_path(const char *path);
>    * device_is_on_pci_bus - Test if a device is on a PCI bus
>    *
>    * @dev:	device to test
> - * @return:	true if it is on a PCI bus, false otherwise
> + * Return:	true if it is on a PCI bus, false otherwise
>    */
>   static inline bool device_is_on_pci_bus(const struct udevice *dev)
>   {
> @@ -971,7 +994,7 @@ static inline bool device_is_on_pci_bus(const struct udevice *dev)
>    *
>    * This stops when it gets an error, with @pos set to the device that failed to
>    * read ofdata.
> -
> + *
>    * This creates a for() loop which works through the available children of
>    * a device in order from start to end. Device ofdata is read by calling
>    * device_of_to_plat() on each one. The devices are not probed.
> @@ -1012,7 +1035,7 @@ static inline bool device_is_on_pci_bus(const struct udevice *dev)
>    * be bound.
>    *
>    * @dev:	Device to scan
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int dm_scan_fdt_dev(struct udevice *dev);
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
