Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B1B15D338
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 08:54:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C276C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 07:54:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A43EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 07:54:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01E7sMs3003428; Fri, 14 Feb 2020 08:54:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=S6q1TmzIhwYt6BK3mYhkPpAvzhJIXt44iczfh1kEyeI=;
 b=SV8TDKseQA+PilwurOO4+R3b/aehe/I97DEQse3o2nsPg8knGgnOT4EZV8pdvcmaa0ny
 hY9UV3w4gpiJaVY+q9/fqjAjz/esjHBc4DNjB+C28YaM7saY3gLCrTspdzQVXDxKSoSP
 Zq64o6kOKpCs3cgaoDex99jtUVv3DeAy8S8eFKcW6WRZJxe3gWT4S0ts/vPDvpv6OBcr
 FldK/sH9jDCcBtajyGwlXdjpzFsra7Up2hUCXF9Qt6sRsDxQJLwjhVuV7o6OONCaiQJh
 zRWZpvLkvvCrnD5DXypLCVqSPOY3qT1dyhW5zadjFBTUSeHH7zzclBgXMo65BaUGCah9 ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uve1wm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 08:54:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA5D5100058;
 Fri, 14 Feb 2020 08:54:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DFD2F21FE8F;
 Fri, 14 Feb 2020 08:54:33 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 08:54:33 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 08:54:33 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 2/4] board: stm32mp1: change dfu function
 to static
Thread-Index: AQHV4wv+frgvqhMEdkak3U0GfrRQOQ==
Date: Fri, 14 Feb 2020 07:54:33 +0000
Message-ID: <61288646-d485-bb74-1e99-468744a49e75@st.com>
References: <20200128094415.5768-1-patrick.delaunay@st.com>
 <20200128094415.5768-3-patrick.delaunay@st.com>
In-Reply-To: <20200128094415.5768-3-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <14272968F78A3344A3201CC1AF821FBB@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_01:2020-02-12,
 2020-02-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] board: stm32mp1: change dfu function
 to static
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


On 1/28/20 10:44 AM, Patrick Delaunay wrote:
> Change the dfu functions dfu_otp_read and dfu_pmic_read to static,
> this patch avoids warning when compiling with W=1.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 2fecfc1b16..b6b70ce20f 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -1010,7 +1010,7 @@ void set_dfu_alt_info(char *interface, char *devstr)
>  #include <dfu.h>
>  #include <power/stpmic1.h>
>  
> -int dfu_otp_read(u64 offset, u8 *buffer, long *size)
> +static int dfu_otp_read(u64 offset, u8 *buffer, long *size)
>  {
>  	struct udevice *dev;
>  	int ret;
> @@ -1030,7 +1030,7 @@ int dfu_otp_read(u64 offset, u8 *buffer, long *size)
>  	return 0;
>  }
>  
> -int dfu_pmic_read(u64 offset, u8 *buffer, long *size)
> +static int dfu_pmic_read(u64 offset, u8 *buffer, long *size)
>  {
>  	int ret;
>  #ifdef CONFIG_PMIC_STPMIC1

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
