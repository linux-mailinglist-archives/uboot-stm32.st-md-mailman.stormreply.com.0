Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA66211DA6
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:59:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB41BC36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:59:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05C14C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:59:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627wsQC028657; Thu, 2 Jul 2020 09:59:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Nm48wvoz5Du671liRIa6iNZoCgOtXsxK6bi2JCp+cB4=;
 b=BeBoJCpA03m2P3HGCZeQZFjhgaPnHLzCLheueWcINCgn7DczSbW00bCwspGWcNYbxne3
 BIjnEyP7IxUZDojrhaOt1utCsJ6W/E1o+m72U8cO7YWWu837TfuKUF6lIxnO6pH58Xxy
 blmrFFG4OyyV3Z9imKgUZ1uD7OzPQ5fqPyv6BCLyJWfRS+/NRaGu5nhipzm8qLogdPNF
 i0+zoMHv2Fl7m4FPO0vxhI6C++60b8C0O1FqU/YbtuGABXBiS8V2lCN9njuLpSSHIsyb
 YEOLpZc3x/4PLzi3JgOYmmHYPEWKl118s+9gFMTvRuGi/58Gm7xl1ERdeBF72lvXy0Qt dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuvwemw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:59:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E54410002A;
 Thu,  2 Jul 2020 09:59:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14E1321F677;
 Thu,  2 Jul 2020 09:59:54 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 09:59:53 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:59:53 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 10/11] pinctrl: stmfx: add information on pin
 configuration
Thread-Index: AQHWOmv27yjdzg0kE0qlBOEZc82R2qjz9yqA
Date: Thu, 2 Jul 2020 07:59:53 +0000
Message-ID: <55421cef-be5b-8b99-e293-9bf9b791d1d8@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
 <20200604143022.v2.10.I1b4851af3f935a0e9b02f80c3f5303f9f80502df@changeid>
In-Reply-To: <20200604143022.v2.10.I1b4851af3f935a0e9b02f80c3f5303f9f80502df@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <DFD118639A248248A941A5D3A1D37A38@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 10/11] pinctrl: stmfx: add information
 on pin configuration
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

On 6/4/20 2:30 PM, Patrick Delaunay wrote:
> Add information on pin configuration used for pinmux command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2: None
>
>  drivers/pinctrl/pinctrl-stmfx.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index 1d326ecf17..c2ea82770e 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -358,6 +358,34 @@ static const char *stmfx_pinctrl_get_pin_name(struct udevice *dev,
>  	return pin_name;
>  }
>  
> +static const char *stmfx_pinctrl_get_pin_conf(struct udevice *dev,
> +					      unsigned int pin, int func)
> +{
> +	int pupd, type;
> +
> +	type = stmfx_conf_get_type(dev, pin);
> +	if (type < 0)
> +		return "";
> +
> +	if (func == GPIOF_OUTPUT) {
> +		if (type)
> +			return "drive-open-drain";
> +		else
> +			return ""; /* default: push-pull*/
> +	}
> +	if (!type)
> +		return ""; /* default: bias-disable*/
> +
> +	pupd = stmfx_conf_get_pupd(dev, pin);
> +	if (pupd < 0)
> +		return "";
> +
> +	if (pupd)
> +		return "bias-pull-up";
> +	else
> +		return "bias-pull-down";
> +}
> +
>  static int stmfx_pinctrl_get_pin_muxing(struct udevice *dev,
>  					unsigned int selector,
>  					char *buf, int size)
> @@ -369,7 +397,9 @@ static int stmfx_pinctrl_get_pin_muxing(struct udevice *dev,
>  	if (func < 0)
>  		return func;
>  
> -	snprintf(buf, size, "%s", func == GPIOF_INPUT ? "input" : "output");
> +	snprintf(buf, size, "%s ", func == GPIOF_INPUT ? "input" : "output");
> +
> +	strncat(buf, stmfx_pinctrl_get_pin_conf(dev, selector, func), size);
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
