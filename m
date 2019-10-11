Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C37DD43FF
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2019 17:17:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD819C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2019 15:17:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA5A7C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 15:17:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9BF6AAk001388; Fri, 11 Oct 2019 17:17:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=f32d235u2Z6d/G1Yz/qXckNLPEk4JfYYoI3C3f18qk0=;
 b=fwYaJOcl5tt6yKz5TmENf0exkgmn+ajLDBW1SAOfipphtVMP3dZxk8weCuzIldq3zS4N
 yFleDNfaTfnzWCEP1qbGS0KBQJtrjJ+ifpjXKc+73TV6aF/yUsKHVXY/ieTHNzoXEuI4
 16S8uoJ5CleFR3hV2+ygz1l5URWOU6o4c/XtggZFBZhSggvGmS5y9w/rX3b1zCh94yj1
 cZTovFFhRz0wKfFQXJ1f2gdNOt706rLdEcdF6P8CBv+WVKNt07xvaS1Dr37ZkwH3luGg
 IS15f3N/+EeOdq5jsXrgfrzfJtl8bIOhtwrona4L/a+ekEIC1aBhh0bboZaQfqw0lXR7 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegn1akmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 17:17:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9EAB100034;
 Fri, 11 Oct 2019 17:17:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A23CB2B646E;
 Fri, 11 Oct 2019 17:17:32 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Oct
 2019 17:17:32 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 11 Oct 2019 17:17:32 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] configs: stm32f746-disco: Fix ramdisk_addr_r
Thread-Index: AQHVbGyzr4rIl7wELUaSh2IV/hDN86dVtOxA
Date: Fri, 11 Oct 2019 15:17:32 +0000
Message-ID: <5e42a6e8928a4d9aaac5b7ce42aa2672@SFHDAG6NODE3.st.com>
References: <20190916085651.5009-1-patrice.chotard@st.com>
In-Reply-To: <20190916085651.5009-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_09:2019-10-10,2019-10-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32f746-disco: Fix
	ramdisk_addr_r
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

Hi Patrice,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: lundi 16 septembre 2019 10:57
> 
> Set ramdisk_addr_r to 0xC0600000.


Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

 
> Reported-by: Christophe Priouzeau <christophe.priouzeau@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  include/configs/stm32f746-disco.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
> index a24127d1a7..cc26f83e74 100644
> --- a/include/configs/stm32f746-disco.h
> +++ b/include/configs/stm32f746-disco.h
> @@ -55,7 +55,7 @@
>  			"pxefile_addr_r=0xC0008000\0" \
>  			"fdt_high=0xffffffffffffffff\0"		\
>  			"initrd_high=0xffffffffffffffff\0"	\
> -			"ramdisk_addr_r=0xD0900000\0"		\
> +			"ramdisk_addr_r=0xC0600000\0"		\
>  			BOOTENV
> 
>  /*
> --
> 2.17.1

Regards

Patrick Delaunay
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
