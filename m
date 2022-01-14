Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB9548EBA7
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jan 2022 15:27:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4F2DC5E2C1;
	Fri, 14 Jan 2022 14:26:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C19EC5C842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 14:26:59 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E9JdZH012380;
 Fri, 14 Jan 2022 15:26:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6Dijv2fT9/WOTK3JpFYo/eHaheOSR33VB06qrYIx3rk=;
 b=XB7eMdkOTORVTMFGn7WEVZ0DATa6RZeCGCdlUjcZIbuSvVtchFH3esSOlf/upebBcR4A
 oN88JyMFVNU3IC5u4i5nquMI5jMOFl2TsgjwFiDSOQfbaTdZQFNYbRyM2MspBZnJHrlP
 3cBx3cePDDK6IvyhtAOI9ChsL77/KLXPv+9fLtoaBZojI3MuvXCzrXFw/h+hAG2xM0kV
 xbIQC+zgPsQNILJiJUegn3OB6uD4DXALlY/7BwBYgb8zRTfewVwCSNpwLBOWp4Rkp1Sn
 HIUs2UrPG7UltC3/JT1AILQBYQATZGdfM1G3fCnbe86kqQ3I+zUGEz8h3V8X8O8tU4e6 wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djyr5k5th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 15:26:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B250610002A;
 Fri, 14 Jan 2022 15:26:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 95C482128AE;
 Fri, 14 Jan 2022 15:26:57 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 14 Jan
 2022 15:26:56 +0100
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>
References: <20220111145808.487868-1-heinrich.schuchardt@canonical.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <80e54df9-46d8-9592-3dd3-4151bd4793ec@foss.st.com>
Date: Fri, 14 Jan 2022 15:26:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111145808.487868-1-heinrich.schuchardt@canonical.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_05,2022-01-14_01,2021-12-02_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 1/1] stm32mp: fix board_get_alt_info_mmc()
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

Hi Heinrich

On 1/11/22 3:58 PM, Heinrich Schuchardt wrote:
> MAX_SEARCH_PARTITIONS is the highest possible partition number.
> Do not skip the last partition in board_get_alt_info_mmc().
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  board/st/common/stm32mp_dfu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
> index a3f0da5b5b..fa48b2a35e 100644
> --- a/board/st/common/stm32mp_dfu.c
> +++ b/board/st/common/stm32mp_dfu.c
> @@ -57,7 +57,7 @@ static void board_get_alt_info_mmc(struct udevice *dev, char *buf)
>  		first = false;
>  	}
>  
> -	for (p = 1; p < MAX_SEARCH_PARTITIONS; p++) {
> +	for (p = 1; p <= MAX_SEARCH_PARTITIONS; p++) {
>  		if (part_get_info(desc, p, &info))
>  			continue;
>  		if (!first)
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
