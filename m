Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4D9497ED6
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Jan 2022 13:15:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04364C5F1D3;
	Mon, 24 Jan 2022 12:15:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CF1DC57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 12:15:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20O8bLFm017248;
 Mon, 24 Jan 2022 13:15:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=q95PNqH69bYiLw7ebC/PPk/GQLBd+vHMuCwIu+QLQ04=;
 b=46l/CSbZEG2KpZrbzV7VXWD4Q8l5ZrNQ9kVhTi2/iGqp+Ua9aNZksXPc9vIYbQtobUB/
 nOh0wK3w7RVhFsGe883IdoXUxLh18zYO8D/nA82f20rAOgdKsYkWLJmJYC0LvG2hfllN
 GRNef2uzbj7PXI0mIGWeQS9i9GYtTNsZurHkpoGWEr96SkZ0J9Ozz19OGKY7nihxfyEj
 SPsoWKUqBPqjqLWBTu+TGj7uaiVNm2RGpr24mksDru/mnEffGfpHFqWwvDyougY8hRlZ
 xMugZQedL6WeLuUDCuHuzIDG71HAmQqdm2RrtD+twPKPNGIwhqXy/nXI6Jb0Kb6g6ZAL CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dsrru1417-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 13:15:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 492E8100034;
 Mon, 24 Jan 2022 13:15:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24FB1214D1A;
 Mon, 24 Jan 2022 13:15:01 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 24 Jan
 2022 13:15:00 +0100
Message-ID: <6c0a90f3-fef6-bd1c-8c21-8d19bf4e7dda@foss.st.com>
Date: Mon, 24 Jan 2022 13:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>
References: <20220111145808.487868-1-heinrich.schuchardt@canonical.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220111145808.487868-1-heinrich.schuchardt@canonical.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_06,2022-01-24_01,2021-12-02_01
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

On 1/11/22 15:58, Heinrich Schuchardt wrote:
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
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
