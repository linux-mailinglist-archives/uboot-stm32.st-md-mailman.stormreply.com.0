Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 587BE2A5FB0
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Nov 2020 09:35:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04ECEC36B35;
	Wed,  4 Nov 2020 08:35:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AFF1C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 08:35:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A48W1T2030711; Wed, 4 Nov 2020 09:35:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=19no12xjmgpOcLAINrXGADEz1+RWyQIrxgeTzTw7UFw=;
 b=pDn9q4WGkk82XsCegLi43G6qZ3PLpW+/dZt8DGGvVCtJah1mzj2lAESnAuEwZYbEBz4M
 ZYH6QYPZosGz4YhVlpTFjw8HnVeyHi3Rg4cXX56UTOBbMoZz6pX8ZxjpUh9TcLh2mXy+
 KvS3o/rmfg8TfAm66vS2iB9l6LWmaiI93JGIVBcdpvzZ1AaRAKMz5RTBr0K+IWdA3KFE
 7zYrsHH26Otyo2jGQZjJi67aOlaa5LAIxKjpQYK98OtV8233TE69bMgpJG00iggktLXk
 XrT7O+bcO8elMtDgF55co8OD0OX9cpa4HsfwhTWzWVnuHySDtCucCS8dWXZLtxp2sjR1 Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywqy3kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Nov 2020 09:35:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A0FD10002A;
 Wed,  4 Nov 2020 09:35:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30CFE23387D;
 Wed,  4 Nov 2020 09:35:54 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov
 2020 09:35:53 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 4 Nov 2020 09:35:53 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] pinctrl: stmfx: update pincontrol and gpio device
 name
Thread-Index: AQHWrQ/7/NW7JoRe50i3MphA5qS1lam3oB+A
Date: Wed, 4 Nov 2020 08:35:53 +0000
Message-ID: <b56720af-0568-0707-1238-d56864166137@st.com>
References: <20201028095157.11327-1-patrick.delaunay@st.com>
In-Reply-To: <20201028095157.11327-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <FF4E9644AA546F46ACB47AF8C2C7D014@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-04_06:2020-11-04,
 2020-11-04 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] pinctrl: stmfx: update pincontrol and
 gpio device name
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

On 10/28/20 10:51 AM, Patrick Delaunay wrote:
> The device name is used in pinmux command and in log trace
> so it is better to use the parent parent name ("stmfx@42" for
> example) than a generic name ("pinctrl" or "stmfx-gpio")
> to identify the device instance.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/pinctrl/pinctrl-stmfx.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index c2ea82770e..b789f3686c 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -408,8 +408,11 @@ static int stmfx_pinctrl_bind(struct udevice *dev)
>  {
>  	struct stmfx_pinctrl *plat = dev_get_platdata(dev);
>  
> +	/* subnode name is not explicit: use father name */
> +	device_set_name(dev, dev->parent->name);
> +
>  	return device_bind_driver_to_node(dev->parent,
> -					  "stmfx-gpio", "stmfx-gpio",
> +					  "stmfx-gpio", dev->parent->name,
>  					  dev_ofnode(dev), &plat->gpio);
>  };
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
