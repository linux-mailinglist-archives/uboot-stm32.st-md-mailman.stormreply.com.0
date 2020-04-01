Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C6C19A6C9
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 10:06:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DFE2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 08:06:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB81DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 08:06:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03181wjV031888; Wed, 1 Apr 2020 10:06:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=UAVeisBK4+pxZxF0hYULHLxJWY7jF2Pu0egdNGWx1bw=;
 b=sJeFJcnp+RhWceD+NlciP5nPQw15gbM6dVWxdjEnSrKnQy870q2zWKU5+XTh1YKMl+b0
 HIF76f94RQJGbr56QsEr/foiHuodEzsZ6039NkNxPqIgQYNcFoxIA6vzN9pVf2B4yUar
 9z5ZKl6wcVH7zncxJMus2341r5wzZjFO6WDCXg802eERT/H6L6FZtQ+aqKho8y7YDLMS
 UdDo4uQM5vSpFR8RmOn0696p3lJYIV9s8jAz54QjVqlxSrorZWbf+iwyWSydGR2VsmqS
 GBd1JMs0XD7OJ6VEs9YJCIFjo8k/WIFm7iurDOBDY16C3YZvTfEQjNliuC8AFg0SiQtO Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301w813ngs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 10:06:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A2F410002A;
 Wed,  1 Apr 2020 10:06:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F216A21CA76;
 Wed,  1 Apr 2020 10:06:00 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 10:06:00 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 10:06:00 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 10/16] board: stm32mp1: set environment
 variable fdtfile
Thread-Index: AQHWB/xhhGUdZxNW/EGrMJbT/x199w==
Date: Wed, 1 Apr 2020 08:06:00 +0000
Message-ID: <ce337c93-a2cc-e71c-938c-482fd30244d7@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.10.If6131518ee15d3299da69d674674ec03978eb58b@changeid>
In-Reply-To: <20200331180330.10.If6131518ee15d3299da69d674674ec03978eb58b@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <73E48B1C1FE7A44A87B22138A984AE24@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 10/16] board: stm32mp1: set environment
 variable fdtfile
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

Hi PAtrick

On 3/31/20 6:04 PM, Patrick Delaunay wrote:
> For booting Linux in the generic distro mechanism and support of
> FDTDIR in extlinux.conf , cmd/pxe.c retrieves the FDT file name
> from "fdtfile" environment variable.
>
> Dynamically build this variable with compatible of STMicroelectronics
> boards.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 52881adef7..89a088cd28 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -715,10 +715,19 @@ int board_late_init(void)
>  	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
>  				 &fdt_compat_len);
>  	if (fdt_compat && fdt_compat_len) {
> -		if (strncmp(fdt_compat, "st,", 3) != 0)
> +		if (strncmp(fdt_compat, "st,", 3) != 0) {
>  			env_set("board_name", fdt_compat);
> -		else
> +		} else {
> +			char dtb_name[256];
> +			int buf_len = sizeof(dtb_name);
> +
>  			env_set("board_name", fdt_compat + 3);
> +
> +			strncpy(dtb_name, fdt_compat + 3, buf_len);
> +			buf_len -= strlen(fdt_compat + 3);
> +			strncat(dtb_name, ".dtb", buf_len);
> +			env_set("fdtfile", dtb_name);
> +		}
>  	}
>  	ret = uclass_get_device_by_driver(UCLASS_MISC,
>  					  DM_GET_DRIVER(stm32mp_bsec),

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
