Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F34E8354
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Oct 2019 09:38:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14C11C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Oct 2019 08:38:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8FD0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 08:38:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9T8bcFH014959; Tue, 29 Oct 2019 09:38:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IXY/qtF4ib1YwrhmqjOSthiOi3nVL0spIj3a7+9om2w=;
 b=eAapKZs5pJgYVWTnMrjo/Gj/zXqcSf+pYnKIdwcWI0aHCZuZOtMv92kp9Q0fwdtXzeOm
 L9uRG3ztH2vcR9VhXgL4PElS36LWBFjEmkUW/uLNjyaOxcuv6fL466Zj8rm8XWyHyDoy
 djUcZCG1tu9b9a2r6gN5gz+dDd3TP4By/CY9J7IzADVvYywSJ99fxXC2m8G4guGDV2U4
 N6BKCQenlcnbelim3tIVHAMBc75K9Nlqc4Ad2iQYG19NyffV+bIZlVKREGPAoQWI3mTZ
 zMhSuDkbYE7fxcPOnx/Qoeh27ubjC9WF+HH6cuNeMTyXGMfJeJYxdhSlYoHefQLT3fMO Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vvd1gp4g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2019 09:38:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56686100038;
 Tue, 29 Oct 2019 09:38:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C7252AC9C2;
 Tue, 29 Oct 2019 09:38:46 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Oct
 2019 09:38:45 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 29 Oct 2019 09:38:45 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Bartosz Bilas <bartosz.bilas@hotmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp1: configs: fix checking the presence of an
 environment
Thread-Index: AQHVjNU4+WE+prDYN0OrwEa8M3bnmKdxR23Q
Date: Tue, 29 Oct 2019 08:38:45 +0000
Message-ID: <b88103917685448fb193eef6cc3877cc@SFHDAG6NODE3.st.com>
References: <VI1PR05MB4733FA3D45034F7B15EE9D08F7670@VI1PR05MB4733.eurprd05.prod.outlook.com>
In-Reply-To: <VI1PR05MB4733FA3D45034F7B15EE9D08F7670@VI1PR05MB4733.eurprd05.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-29_03:2019-10-28,2019-10-29 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: configs: fix checking the
 presence of an environment
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

Hi Bartosz,

Please ad get maintainers or tools/patman to sent patch for stm32mp1 platform.

> From: U-Boot <u-boot-bounces@lists.denx.de> On Behalf Of Bartosz Bilas
> Sent: dimanche 27 octobre 2019 15:46
> To: u-boot@lists.denx.de
> Subject: [U-Boot] [PATCH] stm32mp1: configs: fix checking the presence of an
> environment
> 
> Execute env check command within extra env settings section instead of bootcmd
> whereby we are able to mount rootfs partition from sd card properly.
> 
> Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
> ---
>  include/configs/stm32mp1.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h index
> 988992b336..cadc0358fd 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -115,7 +115,6 @@
>  	"if test ${boot_device} = serial || test ${boot_device} = usb;" \
>  	"then stm32prog ${boot_device} ${boot_instance}; " \
>  	"else " \
> -		"run env_check;" \
>  		"if test ${boot_device} = mmc;" \
>  		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
>  		"if test ${boot_device} = nand;" \
> @@ -160,6 +159,7 @@
>  	"initrd_high=0xffffffff\0" \
>  	"altbootcmd=run bootcmd\0" \
>  	"env_default=1\0" \
> +	"run env_check;" \

It is not a correct place, this define CONFIG_EXTRA_ENV_SETTINGS only the default environment (only set env variable).
Only "bootcmd"  or "preboot" is really executed, this command will be never executed here.

>  	"env_check=if test $env_default -eq 1;"\
>  		" then env set env_default 0;env save;fi\0" \
>  	STM32MP_BOOTCMD \
> --

Can you explain you issue and the board used.

I think your patch only mask the issue, as environment is not saved, U-Boot never write in EXT4 file system.
You should have again the issue if you execute manually by the command "env save".

Today I have no issue on my side with environment in ext4 file system (generated by donwstrean yocto); 
the requests done by U-Boot are acceptable if the ext4 file system is generated with only the features supported by U-Boot.

But we solved issue with latest ext4 tools; since e2fsprogs 1.43 at least, we have ascendance incompatibility as new enable features are enable by default = metadata_csum and dir_index.

We remove them with the mkfs.ext4 option: -O ^metadata_csum,^dir_index

Example : mkfs.ext4 -L rootfs -O ^metadata_csum,^dir_index /dev/sdb4

For details of restriction, see commit 10a7a1b8 : update with hash tree directory of EXT4 not support by U-Boot (EXT4_INDEX_FL)

Best regards

Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
