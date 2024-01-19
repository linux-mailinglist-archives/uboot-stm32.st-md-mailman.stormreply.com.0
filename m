Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7E7832A4E
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jan 2024 14:25:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 577B8C6DD73;
	Fri, 19 Jan 2024 13:25:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FD1FC6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 13:25:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JAjKYi016501; Fri, 19 Jan 2024 14:25:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=3FNUn3yJgBJEy/20fT03PRfNe9JMl7zmB4riqq6Qd5o=; b=jy
 D4Q8eZPGiFqv6dNbBmWpNWWmeU5HEucQFCOaCQh5HOydk27+Zm+5c09nT6Y+V2Ub
 YZgxpB5FeCDcY4wCuenCeAnc0d4DxxjVqcEGAFbQ0mjQtHW3AOQVQV017dEN9w9c
 8QVNNsaf5cKQIa0cFFUGdCMY9VQflnXX1hiyT9kyy2MuCUzT5IHW/HuIVKBqaXvd
 diEqjcW+eVk5IW1diXY6MwvQitz0UuuNnI0okmSkzPW4AcrReFn4lPonz0JKT+vy
 8lQRbWjP1SeDq15ExPSw/dK6sRuSDsavdtWPMiKqvrhahbILKymS4jXnXUdMAZC1
 V2jIsj66VvpoviUtWyvQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkma6e255-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 14:25:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7922100081;
 Fri, 19 Jan 2024 14:25:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1076245506;
 Fri, 19 Jan 2024 14:25:10 +0100 (CET)
Received: from [10.252.4.250] (10.252.4.250) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Jan
 2024 14:25:09 +0100
Message-ID: <c12cb3ab-c91a-4f9c-9f51-a45faf370987@foss.st.com>
Date: Fri, 19 Jan 2024 14:25:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
 <20240115150451.v2.5.I3c66d36ce7ac148b8d78855c73ea5f75ddde9b4f@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240115150451.v2.5.I3c66d36ce7ac148b8d78855c73ea5f75ddde9b4f@changeid>
X-Originating-IP: [10.252.4.250]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 05/14] configs: stm32mp25: add support
	of fuse command
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



On 1/15/24 15:05, Patrick Delaunay wrote:
> Add support of the command fuse with CONFIG_CMD_FUSE to allow access
> on OTP with command line.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  configs/stm32mp25_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
> index 75f27c98b441..9fbd7eb15755 100644
> --- a/configs/stm32mp25_defconfig
> +++ b/configs/stm32mp25_defconfig
> @@ -21,6 +21,7 @@ CONFIG_CMD_ADTIMG=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y
>  CONFIG_CMD_CLK=y
> +CONFIG_CMD_FUSE=y
>  CONFIG_CMD_GPIO=y
>  # CONFIG_CMD_LOADB is not set
>  CONFIG_CMD_CACHE=y
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
