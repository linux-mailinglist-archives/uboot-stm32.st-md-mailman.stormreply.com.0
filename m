Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FB6327FE
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Jun 2019 07:33:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 752F0C98F74
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Jun 2019 05:33:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68A8CC98F73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2019 05:33:19 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x535XDPM031555;
 Mon, 3 Jun 2019 00:33:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1559539993;
 bh=uRNlHOVXZLdiIEhi0fBYeMGhPH117GycLuqlqv2lO34=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ybQXKqY/kZLlHdhDts+l1zYI4XV+5CtbZ81gIhrPe24WzVZD3KLxd+0oO9Fslb4bl
 EXzOyIkYuZaaJ+Auph0XXUpNukZvLJC61XrMG9KpyUKZui7rJnuQ0NcAM5nWn69U2U
 Vj9GaWSMnKCM84SJc2PEaltykBGBdE61TgCRL9Gs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x535XDeU124805
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 Jun 2019 00:33:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 3 Jun
 2019 00:33:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 3 Jun 2019 00:33:12 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x535X9f1084770;
 Mon, 3 Jun 2019 00:33:10 -0500
To: Fabien Dessenne <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>, 
 Patrick Delaunay <patrick.delaunay@st.com>, Christophe Kerello
 <christophe.kerello@st.com>, Patrice Chotard <patrice.chotard@st.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
 <1559308296-17027-3-git-send-email-fabien.dessenne@st.com>
From: Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <0a23d9d7-48e7-e4ba-c873-51f9b4ed80b2@ti.com>
Date: Mon, 3 Jun 2019 11:02:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1559308296-17027-3-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/7] remoteproc: fix function headers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 31/05/19 6:41 PM, Fabien Dessenne wrote:
> Add full function comment headers.
> Fix rproc_is_initialized() return value description.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>


Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh


> ---
>  include/remoteproc.h | 104 +++++++++++++++++++++++++++++++++------------------
>  1 file changed, 68 insertions(+), 36 deletions(-)
> 
> diff --git a/include/remoteproc.h b/include/remoteproc.h
> index a59dba8..aa90a67 100644
> --- a/include/remoteproc.h
> +++ b/include/remoteproc.h
> @@ -45,32 +45,73 @@ struct dm_rproc_uclass_pdata {
>  };
>  
>  /**
> - * struct dm_rproc_ops - Operations that are provided by remote proc driver
> - * @init:	Initialize the remoteproc device invoked after probe (optional)
> - *		Return 0 on success, -ve error on fail
> - * @load:	Load the remoteproc device using data provided(mandatory)
> - *		This takes the following additional arguments.
> - *			addr- Address of the binary image to be loaded
> - *			size- Size of the binary image to be loaded
> - *		Return 0 on success, -ve error on fail
> - * @start:	Start the remoteproc device (mandatory)
> - *		Return 0 on success, -ve error on fail
> - * @stop:	Stop the remoteproc device (optional)
> - *		Return 0 on success, -ve error on fail
> - * @reset:	Reset the remote proc device (optional)
> - *		Return 0 on success, -ve error on fail
> - * @is_running:	Check if the remote processor is running(optional)
> - *		Return 0 on success, 1 if not running, -ve on others errors
> - * @ping:	Ping the remote device for basic communication check(optional)
> - *		Return 0 on success, 1 if not responding, -ve on other errors
> + * struct dm_rproc_ops - Driver model remote proc operations.
> + *
> + * This defines the operations provided by remote proc driver.
>   */
>  struct dm_rproc_ops {
> +	/**
> +	 * init() - Initialize the remoteproc device (optional)
> +	 *
> +	 * This is called after the probe is completed allowing the remote
> +	 * processor drivers to split up the initializations between probe and
> +	 * init if needed.
> +	 *
> +	 * @dev:	Remote proc device
> +	 * @return 0 if all ok, else appropriate error value.
> +	 */
>  	int (*init)(struct udevice *dev);
> +
> +	/**
> +	 * load() - Load the remoteproc device using data provided (mandatory)
> +	 *
> +	 * Load the remoteproc device with an image, do not start the device.
> +	 *
> +	 * @dev:	Remote proc device
> +	 * @addr:	Address of the image to be loaded
> +	 * @size:	Size of the image to be loaded
> +	 * @return 0 if all ok, else appropriate error value.
> +	 */
>  	int (*load)(struct udevice *dev, ulong addr, ulong size);
> +
> +	/**
> +	 * start() - Start the remoteproc device (mandatory)
> +	 *
> +	 * @dev:	Remote proc device
> +	 * @return 0 if all ok, else appropriate error value.
> +	 */
>  	int (*start)(struct udevice *dev);
> +
> +	/**
> +	 * stop() - Stop the remoteproc device (optional)
> +	 *
> +	 * @dev:	Remote proc device
> +	 * @return 0 if all ok, else appropriate error value.
> +	 */
>  	int (*stop)(struct udevice *dev);
> +
> +	/**
> +	 * reset() - Reset the remoteproc device (optional)
> +	 *
> +	 * @dev:	Remote proc device
> +	 * @return 0 if all ok, else appropriate error value.
> +	 */
>  	int (*reset)(struct udevice *dev);
> +
> +	/**
> +	 * is_running() - Check if the remote processor is running (optional)
> +	 *
> +	 * @dev:	Remote proc device
> +	 * @return 0 if running, 1 if not running, -ve on error.
> +	 */
>  	int (*is_running)(struct udevice *dev);
> +
> +	/**
> +	 * ping() - Ping the remote device for basic communication (optional)
> +	 *
> +	 * @dev:	Remote proc device
> +	 * @return 0 on success, 1 if not responding, -ve on other errors.
> +	 */
>  	int (*ping)(struct udevice *dev);
>  };
>  
> @@ -80,23 +121,20 @@ struct dm_rproc_ops {
>  #ifdef CONFIG_REMOTEPROC
>  /**
>   * rproc_init() - Initialize all bound remote proc devices
> - *
> - * Return: 0 if all ok, else appropriate error value.
> + * @return 0 if all ok, else appropriate error value.
>   */
>  int rproc_init(void);
>  
>  /**
>   * rproc_dev_init() - Initialize a remote proc device based on id
>   * @id:		id of the remote processor
> - *
> - * Return: 0 if all ok, else appropriate error value.
> + * @return 0 if all ok, else appropriate error value.
>   */
>  int rproc_dev_init(int id);
>  
>  /**
>   * rproc_is_initialized() - check to see if remoteproc devices are initialized
> - *
> - * Return: 0 if all devices are initialized, else appropriate error value.
> + * @return true if all devices are initialized, false otherwise.
>   */
>  bool rproc_is_initialized(void);
>  
> @@ -105,55 +143,49 @@ bool rproc_is_initialized(void);
>   * @id:		id of the remote processor
>   * @addr:	address in memory where the binary image is located
>   * @size:	size of the binary image
> - *
> - * Return: 0 if all ok, else appropriate error value.
> + * @return 0 if all ok, else appropriate error value.
>   */
>  int rproc_load(int id, ulong addr, ulong size);
>  
>  /**
>   * rproc_start() - Start a remote processor
>   * @id:		id of the remote processor
> - *
> - * Return: 0 if all ok, else appropriate error value.
> + * @return 0 if all ok, else appropriate error value.
>   */
>  int rproc_start(int id);
>  
>  /**
>   * rproc_stop() - Stop a remote processor
>   * @id:		id of the remote processor
> - *
> - * Return: 0 if all ok, else appropriate error value.
> + * @return 0 if all ok, else appropriate error value.
>   */
>  int rproc_stop(int id);
>  
>  /**
>   * rproc_reset() - reset a remote processor
>   * @id:		id of the remote processor
> - *
> - * Return: 0 if all ok, else appropriate error value.
> + * @return 0 if all ok, else appropriate error value.
>   */
>  int rproc_reset(int id);
>  
>  /**
>   * rproc_ping() - ping a remote processor to check if it can communicate
>   * @id:		id of the remote processor
> + * @return 0 if all ok, else appropriate error value.
>   *
>   * NOTE: this might need communication path available, which is not implemented
>   * as part of remoteproc framework - hook on to appropriate bus architecture to
>   * do the same
> - *
> - * Return: 0 if all ok, else appropriate error value.
>   */
>  int rproc_ping(int id);
>  
>  /**
>   * rproc_is_running() - check to see if remote processor is running
>   * @id:		id of the remote processor
> + * @return 0 if running, 1 if not running, -ve on error.
>   *
>   * NOTE: this may not involve actual communication capability of the remote
>   * processor, but just ensures that it is out of reset and executing code.
> - *
> - * Return: 0 if all ok, else appropriate error value.
>   */
>  int rproc_is_running(int id);
>  #else
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
