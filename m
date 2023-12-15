Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD90E814754
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Dec 2023 12:52:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56B8EC6B45B;
	Fri, 15 Dec 2023 11:52:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0450AC65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 11:52:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BF8bpPK017461; Fri, 15 Dec 2023 12:52:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=H7K5KaMBK2vp/9emBcC9NMXrBEzkiihcDRoevXivbhQ=; b=Lt
 aqguOlZYE7XhoFBOUlkF65yjGoiZPByxOg55LE39BJY7829F39SFW26pt2auAa2H
 m8MGAUzy445KQqNlv5hKTpXFTeSYZT+IvY9RtSUeQbueCJzgUSF8Anuj6rXTrHD7
 9zrihx9PstICo8ECx/H9ROFgIFKmVH3qv/JpbnhZagtFw0/204MwJL2yD8HlnuG/
 BD/cChds0puyw9LIZejhQngp/rbhnZrFENPznPTjrv4dl2qHVTy8BxJPSnhBUjqi
 ySJPOTcjP6pIFne6Pc0dvGYUFN/d+13l1FA8cBmXpiciXPuCxkJJ7ogBVV/3O6CZ
 0QAvAijeDc4xEP3A7pkw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v0cbttdfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 12:52:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86C9C100052;
 Fri, 15 Dec 2023 12:52:28 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D717215BDD;
 Fri, 15 Dec 2023 12:52:28 +0100 (CET)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 12:52:28 +0100
Message-ID: <7e2b0b40-1193-4a4f-8397-0ccc99d9122a@foss.st.com>
Date: Fri, 15 Dec 2023 12:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20231117170107.1147598-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20231117170107.1147598-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_06,2023-12-14_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] board: st: common: Fix
	board_get_alt_info_mtd()
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

On 11/17/23 18:01, Patrice Chotard wrote:
> Since MTD devices are partioned, we got the following
> error when command "dfu 0" is executed:
>
> DFU alt info setting: done
> ERROR: Too many arguments for nor0
> ERROR: DFU entities configuration failed!
> ERROR: (partition table does not match dfu_alt_info?)
>
> Fixes: 31325e1b8b9c ("stm32mp1: dynamically build DFU_ALT_INFO")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   board/st/common/stm32mp_dfu.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
> index a8eb8d5cae2..ded3bf81961 100644
> --- a/board/st/common/stm32mp_dfu.c
> +++ b/board/st/common/stm32mp_dfu.c
> @@ -73,7 +73,6 @@ static void board_get_alt_info_mmc(struct udevice *dev, char *buf)
>   static void board_get_alt_info_mtd(struct mtd_info *mtd, char *buf)
>   {
>   	struct mtd_info *part;
> -	bool first = true;
>   	const char *name;
>   	int len, partnum = 0;
>   
> @@ -86,17 +85,13 @@ static void board_get_alt_info_mtd(struct mtd_info *mtd, char *buf)
>   			"mtd %s=", name);
>   
>   	len += snprintf(buf + len, DFU_ALT_BUF_LEN - len,
> -			"%s raw 0x0 0x%llx ",
> +			"%s raw 0x0 0x%llx",
>   			name, mtd->size);
>   
>   	list_for_each_entry(part, &mtd->partitions, node) {
>   		partnum++;
> -		if (!first)
> -			len += snprintf(buf + len, DFU_ALT_BUF_LEN - len, ";");
> -		first = false;
> -
>   		len += snprintf(buf + len, DFU_ALT_BUF_LEN - len,
> -				"%s_%s part %d",
> +				";%s_%s part %d",
>   				name, part->name, partnum);
>   	}
>   }



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
