Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F9C230DE1
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 17:31:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05101C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 15:31:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE581C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 15:31:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SFCJhL004543; Tue, 28 Jul 2020 17:31:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IFo4ViIt/xwHUYJ0c3gMAZZOTPkZU69U3v40SI5+34s=;
 b=RWFma64R0o3tnaCgGTvTmhVnOCpxbtlZP3N7aN1Zaav0LRghU+Vwt6BoJI87mtYcXAmT
 VfptSI3MeLikn3S6vBjfcE15FuURmyua0Xhs3eBL37Z2JDiYwT34vAI1VA+TAtgaqaCs
 xEIsaAM1TELHCw+fhUKjjIqaz+rTs9QjKrs3Dd/kbA11gLiaPqlSupg9BM8zpACH+wWZ
 VCipVjep26GUwInEkpeO+eRzN7cjFzvMV+YouBeJW6Ot0aH+hkd1lGWZY0n1h99jM6mb
 6fgXRuInT4r82/XPGxRzAbMVNlYrwj96DVhzhAXeT5SjIhog+JqJslFQ20wy7JXh52h9 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71xxvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 17:31:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5039E10002A;
 Tue, 28 Jul 2020 17:31:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45B962A8044;
 Tue, 28 Jul 2020 17:31:17 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 17:31:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 17:31:16 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2] stm32mp1: use the command env info -q
 in env_check
Thread-Index: AQHWZPQiMXE+a84TeUmR7lUOe3VVXQ==
Date: Tue, 28 Jul 2020 15:31:16 +0000
Message-ID: <a260ae41-0464-ed58-416a-0fc37b2cdddd@st.com>
References: <20200702164802.15079-1-patrick.delaunay@st.com>
In-Reply-To: <20200702164802.15079-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <F821151A77372B48879E073A7D8A5364@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] stm32mp1: use the command env info -q
 in env_check
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


On 7/2/20 6:48 PM, Patrick Delaunay wrote:
> Activate the new option -q in command "env info"
> to avoid unnecessary trace during boot.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> Hi,
>
> This patch was previous included in V3 serie 158105.
>
> This patch have dependency with serie 184539 for -q option
> and with serie 187232 for stm32mp1 env_check update.
>
>
> Changes in v2:
> - correct commit message (commit-notes) and add review by Patrice
>
>  include/configs/stm32mp1.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index e927787be0..038a639843 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -155,7 +155,7 @@
>  	"splashimage=0xc4300000\0"  \
>  	"ramdisk_addr_r=0xc4400000\0" \
>  	"altbootcmd=run bootcmd\0" \
> -	"env_check=if env info -p -d; then env save; fi\0" \
> +	"env_check=if env info -p -d -q; then env save; fi\0" \
>  	STM32MP_BOOTCMD \
>  	BOOTENV \
>  	"boot_net_usb_start=true\0"
Applied to u-boot-stm/master

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
