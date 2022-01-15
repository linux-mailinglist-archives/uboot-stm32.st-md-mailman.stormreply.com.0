Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E8B48F5FB
	for <lists+uboot-stm32@lfdr.de>; Sat, 15 Jan 2022 09:24:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D9FEC60461;
	Sat, 15 Jan 2022 08:24:43 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA5F5C5C842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jan 2022 08:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642235079;
 bh=BfBs//seYqVwhBEgKvzsuey92in8cy97MOJTgFRooCA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=l0rvJ6ZhiX4M4PjzRAXjV+30rLrM+jGyMR5R35eZYcGZ9RI0DWXROJcRJRzHjCoKZ
 EkKWZjtLatewo23sn1FYp/zZ6awbzJtBCITMpX2fiCBg9Zt10foGN73a3a6GvCWA1P
 1vpBZeRLmcURggUotAAM2Hi3+xNorLmfnCxsnnyU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.94] ([88.152.144.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrQEn-1mVn3A03mB-00oUUq; Sat, 15
 Jan 2022 09:24:39 +0100
Message-ID: <0f089103-2d5e-f8f5-124c-b72aa23291c5@gmx.de>
Date: Sat, 15 Jan 2022 09:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
X-Provags-ID: V03:K1:nosLEMyStYJxECZrZR1c2rqZLqVA3eZJ3k26f9WvTbRCnOTMPP6
 83E7wFAXDizZnJnKcjdYQiwx6kul7R0tBz/zdRPQF6c497AU6XHZ507E4a/rVP5vvAj9KcW
 8xhuiJZ6sh7H6+8Qx9+q2AYlepBY2dS/rVQLbKnSlNpkeTkvdhDPa6CXKyGU6Q5nmWxiLq5
 SKXG5qMzQuLcf2Izu5r9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VohTz06dKWg=:ySsNC544q/b0jo6usr4iUQ
 9Az/tX4L2j+Q4Jv3xLmpf4WmFcgcjSlmMlE5UBF+P87YR2fNK1ASw+hhCU7NX7pmqtAYX1hHI
 G1nyNa7PpwjIjXsZSCE0LAz1QALSo9XGDK/hDWvsLR9EML6H/ekZww6KRCiHBrYaNYeupUCPn
 AJJpBWJBZqCe3U7r3+tT8LTQRFJfO7HWFYYYqAJCvi/WCyuAnnev5SfIkFiISp1ruB5Zbrcjg
 yon98ELGUq/Z8WMIXyxZAz3mle8Nm+ObjZem21WkAT/ouqWzkVkojAy3S+NFTAEAJtKgbtiUS
 aiJP0t62amoL+FySUGA7mxMbtSC+WKJwKQ6NKbvU1Ci5iAj8I4/siMMYJUz/6eQhhI0eKCsUH
 P17jaPD+dHD31F9KyI1NpOYdhLyB3ybpYr7rnVtaqVbCM/PP9kT3HX0DLNAraPUD5Nz46Nq83
 otuOdxiAPqx5g5+oUIOU0UbsbBF15YzV8OlsDoheCtsPEt0juULUcndcRvsIJrX/fZ/cpgX6s
 qNEGeekAgZej5g5+XbvvIcs0MluckTscOdEdefeQZs4QmN4SJi31kAoCGiQDTdTdf8L+kuuqr
 CjtVgJ3rCeaO06seLhiDBmrici+QNjt5vVdsCtObJD5GPv9E2jyYPt7hdgci0p086SESdhEvh
 2w1jszljg/5zIHkyKbZ2rZeKfeq2S2g8RO6hiGSRrkFCmS15JILp0eE/dcFRxG9mNgyECL3HV
 h3CLTLgKKy7zpdwCPHFZZBE55+w5t+jbSiEfJE6m6HHnatXTh68+RupFWuetBV1gR5+c+hTYB
 pIHskzIXKxhaRbj8oUFzEd/tNWH+I0a1YqjcSoagK2nvZPblZBtPvFauog0RxHdgeWWdzms7n
 GicgL3t6Hw65Bw4UHldRez76JY6XTT51xnH84baFwBdzNhN/+K/MlHa0t4n1foGL1Wqo+kiMi
 +m2wM0TJlLrkWYY2l1d4QJEoYOKgc6C37WztXXWnjlIXFJNquJyw2hcwyw5LvhwxhlxAHoNUO
 nHLL0jr9jnX1CAZbsUJuxjnaUDtfvK5xczFzSX/QMXURikaBxjvkWrg4e66WIC08CqB44e474
 pLaZ/Su4D2jqyw=
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 1/9] doc: add include/dm/uclass.h to the
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
> Correct Sphinx style comments in include/dm/uclass.h
> and add the driver model UCLASS API to the HTML documentation.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   doc/api/dm.rst      |  9 ++++++
>   doc/api/index.rst   |  1 +
>   include/dm/uclass.h | 75 ++++++++++++++++++++++-----------------------
>   3 files changed, 47 insertions(+), 38 deletions(-)
>   create mode 100644 doc/api/dm.rst
>
> diff --git a/doc/api/dm.rst b/doc/api/dm.rst
> new file mode 100644
> index 0000000000..edce25da51
> --- /dev/null
> +++ b/doc/api/dm.rst
> @@ -0,0 +1,9 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +Driver Model
> +============
> +
> +Uclass and Driver
> +-----------------
> +
> +.. kernel-doc:: include/dm/uclass.h
> diff --git a/doc/api/index.rst b/doc/api/index.rst
> index 806c7385a6..3f36174167 100644
> --- a/doc/api/index.rst
> +++ b/doc/api/index.rst
> @@ -7,6 +7,7 @@ U-Boot API documentation
>      :maxdepth: 2
>
>      dfu
> +   dm
>      efi
>      getopt
>      linker_lists
> diff --git a/include/dm/uclass.h b/include/dm/uclass.h
> index f1fd2ba246..a12a872d94 100644
> --- a/include/dm/uclass.h
> +++ b/include/dm/uclass.h
> @@ -84,7 +84,7 @@ struct udevice;
>    * its children. If non-zero this is the size of this data, to be allocated
>    * in the child device's parent_plat pointer. This value is only used as
>    * a fallback if this member is 0 in the driver.
> - * @flags: Flags for this uclass (DM_UC_...)
> + * @flags: Flags for this uclass ``(DM_UC_...)``
>    */
>   struct uclass_driver {
>   	const char *name;
> @@ -127,17 +127,16 @@ struct uclass_driver {
>    * build time. Before this is used, an extern UCLASS_DRIVER() must have been
>    * declared.
>    *
> - * For example:
> + * For example: ::

Nits:
"For example::" has the same effect. I will change this when merging.

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

>    *
> - * extern UCLASS_DRIVER(clk);
> - *
> - * struct uclass_driver *drvs[] = {
> - *	DM_UCLASS_DRIVER_REF(clk),
> - * };
> + *   extern UCLASS_DRIVER(clk);
> + *   struct uclass_driver *drvs[] = {
> + *       DM_UCLASS_DRIVER_REF(clk),
> + *   };
>    *
>    * @_name: Name of the uclass_driver. This must be a valid C identifier, used by
>    *	the linker_list.
> - * @returns struct uclass_driver * for the uclass driver
> + * Return: struct uclass_driver * for the uclass driver
>    */
>   #define DM_UCLASS_DRIVER_REF(_name)					\
>   	ll_entry_ref(struct uclass_driver, _name, uclass_driver)
> @@ -145,8 +144,8 @@ struct uclass_driver {
>   /**
>    * uclass_get_priv() - Get the private data for a uclass
>    *
> - * @uc		Uclass to check
> - * @return private data, or NULL if none
> + * @uc:	Uclass to check
> + * Return: private data, or NULL if none
>    */
>   void *uclass_get_priv(const struct uclass *uc);
>
> @@ -159,8 +158,8 @@ void *uclass_get_priv(const struct uclass *uc);
>    *
>    * @key: ID to look up
>    * @ucp: Returns pointer to uclass (there is only one per ID)
> - * @return 0 if OK, -EDEADLK if driver model is not yet inited, other -ve on
> - *	other error
> + * Return: 0 if OK, -EDEADLK if driver model is not yet inited, other -ve on
> + * other error
>    */
>   int uclass_get(enum uclass_id key, struct uclass **ucp);
>
> @@ -168,16 +167,16 @@ int uclass_get(enum uclass_id key, struct uclass **ucp);
>    * uclass_get_name() - Get the name of a uclass driver
>    *
>    * @id: ID to look up
> - * @returns the name of the uclass driver for that ID, or NULL if none
> + * Return: the name of the uclass driver for that ID, or NULL if none
>    */
>   const char *uclass_get_name(enum uclass_id id);
>
>   /**
> - * uclass_get_by_name() - Look up a uclass by its driver name
> + * uclass_get_by_name_len() - Look up a uclass by its partial driver name
>    *
>    * @name: Name to look up
> - * @len: Length of name
> - * @returns the associated uclass ID, or UCLASS_INVALID if not found
> + * @len: Length of the partial name
> + * Return: the associated uclass ID, or UCLASS_INVALID if not found
>    */
>   enum uclass_id uclass_get_by_name_len(const char *name, int len);
>
> @@ -185,7 +184,7 @@ enum uclass_id uclass_get_by_name_len(const char *name, int len);
>    * uclass_get_by_name() - Look up a uclass by its driver name
>    *
>    * @name: Name to look up
> - * @returns the associated uclass ID, or UCLASS_INVALID if not found
> + * Return: the associated uclass ID, or UCLASS_INVALID if not found
>    */
>   enum uclass_id uclass_get_by_name(const char *name);
>
> @@ -197,7 +196,7 @@ enum uclass_id uclass_get_by_name(const char *name);
>    * @id: ID to look up
>    * @index: Device number within that uclass (0=first)
>    * @devp: Returns pointer to device (there is only one per for each ID)
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int uclass_get_device(enum uclass_id id, int index, struct udevice **devp);
>
> @@ -211,7 +210,7 @@ int uclass_get_device(enum uclass_id id, int index, struct udevice **devp);
>    * @id: ID to look up
>    * @name: name of a device to get
>    * @devp: Returns pointer to device (the first one with the name)
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int uclass_get_device_by_name(enum uclass_id id, const char *name,
>   			      struct udevice **devp);
> @@ -228,7 +227,7 @@ int uclass_get_device_by_name(enum uclass_id id, const char *name,
>    * @id: ID to look up
>    * @seq: Sequence number to find (0=first)
>    * @devp: Returns pointer to device (there is only one for each seq)
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int uclass_get_device_by_seq(enum uclass_id id, int seq, struct udevice **devp);
>
> @@ -243,7 +242,7 @@ int uclass_get_device_by_seq(enum uclass_id id, int seq, struct udevice **devp);
>    * @id: ID to look up
>    * @node: Device tree offset to search for (if -ve then -ENODEV is returned)
>    * @devp: Returns pointer to device (there is only one for each node)
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int uclass_get_device_by_of_offset(enum uclass_id id, int node,
>   				   struct udevice **devp);
> @@ -257,9 +256,9 @@ int uclass_get_device_by_of_offset(enum uclass_id id, int node,
>    * The device is probed to activate it ready for use.
>    *
>    * @id: ID to look up
> - * @np: Device tree node to search for (if NULL then -ENODEV is returned)
> + * @node: Device tree node to search for (if NULL then -ENODEV is returned)
>    * @devp: Returns pointer to device (there is only one for each node)
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int uclass_get_device_by_ofnode(enum uclass_id id, ofnode node,
>   				struct udevice **devp);
> @@ -275,8 +274,8 @@ int uclass_get_device_by_ofnode(enum uclass_id id, ofnode node,
>    * @phandle_id: the phandle id to look up
>    * @devp: Returns pointer to device (there is only one for each node). NULL if
>    *	there is no such device.
> - * @return 0 if OK, -ENODEV if there is no device match the phandle, other
> - *	-ve on error
> + * Return: 0 if OK, -ENODEV if there is no device match the phandle, other
> + * -ve on error
>    */
>   int uclass_get_device_by_phandle_id(enum uclass_id id, uint phandle_id,
>   				    struct udevice **devp);
> @@ -292,8 +291,8 @@ int uclass_get_device_by_phandle_id(enum uclass_id id, uint phandle_id,
>    * @parent: Parent device containing the phandle pointer
>    * @name: Name of property in the parent device node
>    * @devp: Returns pointer to device (there is only one for each node)
> - * @return 0 if OK, -ENOENT if there is no @name present in the node, other
> - *	-ve on error
> + * Return: 0 if OK, -ENOENT if there is no @name present in the node, other
> + * -ve on error
>    */
>   int uclass_get_device_by_phandle(enum uclass_id id, struct udevice *parent,
>   				 const char *name, struct udevice **devp);
> @@ -310,7 +309,7 @@ int uclass_get_device_by_phandle(enum uclass_id id, struct udevice *parent,
>    * @id: ID to look up
>    * @drv: Driver to look for
>    * @devp: Returns pointer to the first device with that driver
> - * @return 0 if OK, -ve on error
> + * Return: 0 if OK, -ve on error
>    */
>   int uclass_get_device_by_driver(enum uclass_id id, const struct driver *drv,
>   				struct udevice **devp);
> @@ -327,7 +326,7 @@ int uclass_get_device_by_driver(enum uclass_id id, const struct driver *drv,
>    * @devp: Returns pointer to the first device in that uclass if no error
>    * occurred, or NULL if there is no first device, or an error occurred with
>    * that device.
> - * @return 0 if OK (found or not found), other -ve on error
> + * Return: 0 if OK (found or not found), other -ve on error
>    */
>   int uclass_first_device(enum uclass_id id, struct udevice **devp);
>
> @@ -338,7 +337,7 @@ int uclass_first_device(enum uclass_id id, struct udevice **devp);
>    *
>    * @id: Uclass ID to look up
>    * @devp: Returns pointer to the first device in that uclass, or NULL if none
> - * @return 0 if found, -ENODEV if not found, other -ve on error
> + * Return: 0 if found, -ENODEV if not found, other -ve on error
>    */
>   int uclass_first_device_err(enum uclass_id id, struct udevice **devp);
>
> @@ -353,7 +352,7 @@ int uclass_first_device_err(enum uclass_id id, struct udevice **devp);
>    * @devp: On entry, pointer to device to lookup. On exit, returns pointer
>    * to the next device in the uclass if no error occurred, or NULL if there is
>    * no next device, or an error occurred with that next device.
> - * @return 0 if OK (found or not found), other -ve on error
> + * Return: 0 if OK (found or not found), other -ve on error
>    */
>   int uclass_next_device(struct udevice **devp);
>
> @@ -365,7 +364,7 @@ int uclass_next_device(struct udevice **devp);
>    * @devp: On entry, pointer to device to lookup. On exit, returns pointer
>    * to the next device in the uclass if no error occurred, or NULL if
>    * there is no next device.
> - * @return 0 if found, -ENODEV if not found, other -ve on error
> + * Return: 0 if found, -ENODEV if not found, other -ve on error
>    */
>   int uclass_next_device_err(struct udevice **devp);
>
> @@ -380,7 +379,7 @@ int uclass_next_device_err(struct udevice **devp);
>    * @id: Uclass ID to look up
>    * @devp: Returns pointer to the first device in that uclass, or NULL if there
>    * is no first device
> - * @return 0 if OK (found or not found), other -ve on error. If an error occurs
> + * Return: 0 if OK (found or not found), other -ve on error. If an error occurs
>    * it is still possible to move to the next device.
>    */
>   int uclass_first_device_check(enum uclass_id id, struct udevice **devp);
> @@ -395,7 +394,7 @@ int uclass_first_device_check(enum uclass_id id, struct udevice **devp);
>    *
>    * @devp: On entry, pointer to device to lookup. On exit, returns pointer
>    * to the next device in the uclass if any
> - * @return 0 if OK (found or not found), other -ve on error. If an error occurs
> + * Return: 0 if OK (found or not found), other -ve on error. If an error occurs
>    * it is still possible to move to the next device.
>    */
>   int uclass_next_device_check(struct udevice **devp);
> @@ -409,7 +408,7 @@ int uclass_next_device_check(struct udevice **devp);
>    * @id: Uclass ID to check
>    * @driver_data: Driver data to search for
>    * @devp: Returns pointer to the first matching device in that uclass, if found
> - * @return 0 if found, -ENODEV if not found, other -ve on error
> + * Return: 0 if found, -ENODEV if not found, other -ve on error
>    */
>   int uclass_first_device_drvdata(enum uclass_id id, ulong driver_data,
>   				struct udevice **devp);
> @@ -421,7 +420,7 @@ int uclass_first_device_drvdata(enum uclass_id id, ulong driver_data,
>    * looking for its ID.
>    *
>    * @id: uclass ID to look up
> - * @return 0 if OK, other -ve on error
> + * Return: 0 if OK, other -ve on error
>    */
>   int uclass_probe_all(enum uclass_id id);
>
> @@ -429,7 +428,7 @@ int uclass_probe_all(enum uclass_id id);
>    * uclass_id_count() - Count the number of devices in a uclass
>    *
>    * @id: uclass ID to look up
> - * @return number of devices in that uclass (0 if none)
> + * Return: number of devices in that uclass (0 if none)
>    */
>   int uclass_id_count(enum uclass_id id);
>
> @@ -444,7 +443,7 @@ int uclass_id_count(enum uclass_id id);
>    * @id: enum uclass_id ID to use
>    * @pos: struct udevice * to hold the current device. Set to NULL when there
>    * are no more devices.
> - * @uc: temporary uclass variable (struct uclass *)
> + * @uc: temporary uclass variable (``struct uclass *``)
>    */
>   #define uclass_id_foreach_dev(id, pos, uc) \
>   	if (!uclass_get(id, &uc)) \
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
