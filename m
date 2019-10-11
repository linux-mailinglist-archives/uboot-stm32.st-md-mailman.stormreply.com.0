Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 312D6D43F7
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2019 17:16:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1F6EC36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2019 15:16:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBFEAC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 15:16:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9BF6Bv9001395; Fri, 11 Oct 2019 17:16:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=kDKSzeQxV4GhYzfVqwcq3SfK4hFJ/LzgNaCsh4IrA/Q=;
 b=ubYuoYejOZzz4GUytA5tXSLGOV7d5THvHrTTVJYx1zmJFWfj7AgNfmZHeYrNZ/z51Cn4
 k/d1PWyY6HHeQSTq3/Nau1wI/jqL/UhH+mSvZLH52mzegQ3LuPSmlzmdUkI5q/l7MBgt
 SobGAatqS125LowIKQFeZ0EPSDHKqNmlB/9bRWSnHMr50iIA/UQaBluHPVq/keF9LPo6
 j/mRhDn2x441Bd8wjfHI5ugfpW3BR2ds3j2nXMQ4dhRPbzQ9Kw44FTXrTkCDexuwQw9n
 irxx7TXFSQjmhYLBxnHHm3G3/jzvSqkfRl4GLyJDbhgcpr9eF/FIj5Dp0OqjE9UKvr/O kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegn1akg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 17:16:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3D7E10002A;
 Fri, 11 Oct 2019 17:16:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC7BB2B6467;
 Fri, 11 Oct 2019 17:16:31 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Oct
 2019 17:16:31 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 11 Oct 2019 17:16:31 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 5/5] configs: stm32h743-eval: Disable CONFIG_NET flag
Thread-Index: AQHVbS9OsTpvgdZjyEmbTAa+mIzOT6dVsy6w
Date: Fri, 11 Oct 2019 15:16:31 +0000
Message-ID: <f1ef6eb84eb543cc90393e6be3d4a884@SFHDAG6NODE3.st.com>
References: <20190917080946.9593-1-patrice.chotard@st.com>
 <20190917080946.9593-6-patrice.chotard@st.com>
In-Reply-To: <20190917080946.9593-6-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_09:2019-10-10,2019-10-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 5/5] configs: stm32h743-eval: Disable
	CONFIG_NET flag
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
> Sent: mardi 17 septembre 2019 10:10
> 
> Network support was never added on this board, disable CONFIG_NET flag to
> avoid following warning:
> 
> ===================== WARNING ====================== This board
> does not use CONFIG_DM_ETH (Driver Model for Ethernet drivers). Please
> update the board to use CONFIG_DM_ETH before the v2020.07 release. Failure to
> update by the deadline may result in board removal.
> See doc/driver-model/migration.rst for more info.
> ====================================================


Acked-by: Patrick Delaunay <patrick.delaunay@st.com>


> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  configs/stm32h743-eval_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stm32h743-eval_defconfig b/configs/stm32h743-eval_defconfig
> index e1c6cbf503..cacfdb5eb2 100644
> --- a/configs/stm32h743-eval_defconfig
> +++ b/configs/stm32h743-eval_defconfig
> @@ -24,6 +24,7 @@ CONFIG_CMD_EXT4_WRITE=y  #
> CONFIG_ISO_PARTITION is not set  CONFIG_OF_CONTROL=y
> CONFIG_DEFAULT_DEVICE_TREE="stm32h743i-eval"
> +# CONFIG_NET is not set
>  CONFIG_DM_MMC=y
>  CONFIG_STM32_SDMMC2=y
>  # CONFIG_PINCTRL_FULL is not set
> --
> 2.17.1

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
