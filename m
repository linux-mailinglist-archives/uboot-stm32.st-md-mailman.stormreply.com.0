Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0890280FFC
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 11:37:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96557C424B0;
	Fri,  2 Oct 2020 09:37:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 229E6C424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:37:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0929MmZD005154; Fri, 2 Oct 2020 11:37:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=1Bb/8/2jp5ueLAj4aMUvVGOQq9rvwZIozTPMRsJEOvw=;
 b=dsCtlC0yndaKLINpf/GBJ34Pf8SkMzWNWxOUG81rr3Q9Y3LX0Vx62UJLfRVO4KKJ2IJa
 npzsCn6z4iXMdit7dNlp8zwLtrfmu7rdAWvb1zi+VJpACHVYTC9uV1nUPQF10EVgtN0H
 RE6GM3LnUHJhHhxtHV6Q4DhQAyhF23x/biPEep2QVADNv9k2GwrP0a0JjAhVWLmLBwYv
 53Vk2HP8LuIsqYwCBSOKjl/+vFjFFHdHjms5m49E/V1AwYqQFWi7b/0Qo0kthO8x1qxa
 zHWtFP+0y58iFY2CoVdehIUvW4UknC9vMroWkurisG+QmOAl2HXYVgrEiHOTLi+VxSEd Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33sts8ate1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 11:37:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 348DB100034;
 Fri,  2 Oct 2020 11:37:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1962B2A5609;
 Fri,  2 Oct 2020 11:37:46 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 11:37:42 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 11:37:42 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] pinctrl: stm32: Convert to use APIs which support
 live DT
Thread-Index: AQHWhsD1prGuHBxLr0ig+Dq12yME16mEEE4A
Date: Fri, 2 Oct 2020 09:37:42 +0000
Message-ID: <ba773a2f-4856-ac09-1ea8-146bde573d80@st.com>
References: <20200909155015.29227-1-patrick.delaunay@st.com>
In-Reply-To: <20200909155015.29227-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <40CABC2F80EC2D458922A113A384E9F9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_05:2020-10-02,
 2020-10-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] pinctrl: stm32: Convert to use APIs
 which support live DT
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

Hi Patrick

On 9/9/20 5:50 PM, Patrick Delaunay wrote:
> Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
> driver can support live DT.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/pinctrl/pinctrl_stm32.c | 43 ++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
> index 71fa29a389..24ed83dd46 100644
> --- a/drivers/pinctrl/pinctrl_stm32.c
> +++ b/drivers/pinctrl/pinctrl_stm32.c
> @@ -13,8 +13,6 @@
>  #include <linux/err.h>
>  #include <linux/libfdt.h>
>  
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define MAX_PINS_ONE_IP			70
>  #define MODE_BITS_MASK			3
>  #define OSPEED_MASK			3
> @@ -308,7 +306,8 @@ static int prep_gpio_dsc(struct stm32_gpio_dsc *gpio_dsc, u32 port_pin)
>  	return 0;
>  }
>  
> -static int prep_gpio_ctl(struct stm32_gpio_ctl *gpio_ctl, u32 gpio_fn, int node)
> +static int prep_gpio_ctl(struct stm32_gpio_ctl *gpio_ctl, u32 gpio_fn,
> +			 ofnode node)
>  {
>  	gpio_fn &= 0x00FF;
>  	gpio_ctl->af = 0;
> @@ -329,16 +328,16 @@ static int prep_gpio_ctl(struct stm32_gpio_ctl *gpio_ctl, u32 gpio_fn, int node)
>  		break;
>  	}
>  
> -	gpio_ctl->speed = fdtdec_get_int(gd->fdt_blob, node, "slew-rate", 0);
> +	gpio_ctl->speed = ofnode_read_u32_default(node, "slew-rate", 0);
>  
> -	if (fdtdec_get_bool(gd->fdt_blob, node, "drive-open-drain"))
> +	if (ofnode_read_bool(node, "drive-open-drain"))
>  		gpio_ctl->otype = STM32_GPIO_OTYPE_OD;
>  	else
>  		gpio_ctl->otype = STM32_GPIO_OTYPE_PP;
>  
> -	if (fdtdec_get_bool(gd->fdt_blob, node, "bias-pull-up"))
> +	if (ofnode_read_bool(node, "bias-pull-up"))
>  		gpio_ctl->pupd = STM32_GPIO_PUPD_UP;
> -	else if (fdtdec_get_bool(gd->fdt_blob, node, "bias-pull-down"))
> +	else if (ofnode_read_bool(node, "bias-pull-down"))
>  		gpio_ctl->pupd = STM32_GPIO_PUPD_DOWN;
>  	else
>  		gpio_ctl->pupd = STM32_GPIO_PUPD_NO;
> @@ -350,32 +349,37 @@ static int prep_gpio_ctl(struct stm32_gpio_ctl *gpio_ctl, u32 gpio_fn, int node)
>  	return 0;
>  }
>  
> -static int stm32_pinctrl_config(int offset)
> +static int stm32_pinctrl_config(ofnode node)
>  {
>  	u32 pin_mux[MAX_PINS_ONE_IP];
>  	int rv, len;
> +	ofnode subnode;
>  
>  	/*
>  	 * check for "pinmux" property in each subnode (e.g. pins1 and pins2 for
>  	 * usart1) of pin controller phandle "pinctrl-0"
>  	 * */
> -	fdt_for_each_subnode(offset, gd->fdt_blob, offset) {
> +	ofnode_for_each_subnode(subnode, node) {
>  		struct stm32_gpio_dsc gpio_dsc;
>  		struct stm32_gpio_ctl gpio_ctl;
>  		int i;
>  
> -		len = fdtdec_get_int_array_count(gd->fdt_blob, offset,
> -						 "pinmux", pin_mux,
> -						 ARRAY_SIZE(pin_mux));
> +		rv = ofnode_read_size(subnode, "pinmux");
> +		if (rv < 0)
> +			return rv;
> +		len = rv / sizeof(pin_mux[0]);
>  		debug("%s: no of pinmux entries= %d\n", __func__, len);
> -		if (len < 0)
> +		if (len > MAX_PINS_ONE_IP)
>  			return -EINVAL;
> +		rv = ofnode_read_u32_array(subnode, "pinmux", pin_mux, len);
> +		if (rv < 0)
> +			return rv;
>  		for (i = 0; i < len; i++) {
>  			struct gpio_desc desc;
>  
>  			debug("%s: pinmux = %x\n", __func__, *(pin_mux + i));
>  			prep_gpio_dsc(&gpio_dsc, *(pin_mux + i));
> -			prep_gpio_ctl(&gpio_ctl, *(pin_mux + i), offset);
> +			prep_gpio_ctl(&gpio_ctl, *(pin_mux + i), subnode);
>  			rv = uclass_get_device_by_seq(UCLASS_GPIO,
>  						      gpio_dsc.port,
>  						      &desc.dev);
> @@ -424,19 +428,18 @@ static int stm32_pinctrl_bind(struct udevice *dev)
>  #if CONFIG_IS_ENABLED(PINCTRL_FULL)
>  static int stm32_pinctrl_set_state(struct udevice *dev, struct udevice *config)
>  {
> -	return stm32_pinctrl_config(dev_of_offset(config));
> +	return stm32_pinctrl_config(dev_ofnode(config));
>  }
>  #else /* PINCTRL_FULL */
>  static int stm32_pinctrl_set_state_simple(struct udevice *dev,
>  					  struct udevice *periph)
>  {
> -	const void *fdt = gd->fdt_blob;
>  	const fdt32_t *list;
>  	uint32_t phandle;
> -	int config_node;
> +	ofnode config_node;
>  	int size, i, ret;
>  
> -	list = fdt_getprop(fdt, dev_of_offset(periph), "pinctrl-0", &size);
> +	list = ofnode_get_property(dev_ofnode(periph), "pinctrl-0", &size);
>  	if (!list)
>  		return -EINVAL;
>  
> @@ -446,8 +449,8 @@ static int stm32_pinctrl_set_state_simple(struct udevice *dev,
>  	for (i = 0; i < size; i++) {
>  		phandle = fdt32_to_cpu(*list++);
>  
> -		config_node = fdt_node_offset_by_phandle(fdt, phandle);
> -		if (config_node < 0) {
> +		config_node = ofnode_get_by_phandle(phandle);
> +		if (!ofnode_valid(config_node)) {
>  			pr_err("prop pinctrl-0 index %d invalid phandle\n", i);
>  			return -EINVAL;
>  		}

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
