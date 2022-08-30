Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA515A5EC8
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Aug 2022 11:00:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED161C5A4FD;
	Tue, 30 Aug 2022 09:00:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B68FC57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 09:00:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U4DUZ6010019;
 Tue, 30 Aug 2022 11:00:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UGet1Ch6caUHTUzdUCvwWhasO4su+oTzWmdPKvTk0nk=;
 b=5sRMsJVe4tRaGBDT8K4vHMOxHOrrlZG+tgYK0dnf6q656nXL/OPZPIJOi1mS0g2jtfdO
 xlDBpWCMdpa821OYXlMgyWxQyIXji5kAsfsouY/Zwk/tThfPk6VH5FyB9BQ3SvVGxexO
 QauT5bWwNZOXW7B2y02008Y/SHapYMyjUBJYHMvzUgXUoWWob7O7Q+n8JdQMmmqbniXs
 NS0JjVb6L3TEqAY4SeyU7XX8qfwy0CHqofno8qUcG2slImN5CY/+uUO2g3p9gSVCFw+8
 8MFSaLpk+IxyFokGCMgTs122N+3qx8KdUCrxdKDjuPdDUob23rJsZX8Kpo0MSPIhEW40 Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j78d9f17f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 11:00:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75EEF10002A;
 Tue, 30 Aug 2022 11:00:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65E33217B87;
 Tue, 30 Aug 2022 11:00:07 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.122) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 30 Aug
 2022 11:00:06 +0200
Message-ID: <e0c321e3-0976-cfb5-5ade-d2809582007e@foss.st.com>
Date: Tue, 30 Aug 2022 11:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220824134237.1091304-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220824134237.1091304-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_04,2022-08-25_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Fix display-timings
 settings for stm32f746-disco
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 8/24/22 15:42, Patrice Chotard wrote:
> Since commit ef4ce6df3289 "video: stm32: stm32_ltdc: fix data enable polarity"
> The panel display output wasn't functional anymore.
> Device tree display-timings de-active property value must be updated
> to 1.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/stm32f746-disco-u-boot.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
