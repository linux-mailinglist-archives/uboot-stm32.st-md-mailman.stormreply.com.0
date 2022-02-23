Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE14C0D80
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Feb 2022 08:43:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33951C5C829;
	Wed, 23 Feb 2022 07:43:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B871C57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Feb 2022 07:43:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21N79ZCq026139;
 Wed, 23 Feb 2022 08:43:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2K7iNT3ZvVbl6/1hsgb0JGeEE4JMAiBNAzwSbi1iuAw=;
 b=WjC2me7yIJ1MGozzM6foN/OiFRsa1byXpyKrax6ZWqg/biRXnPhIGb0G+kZR4ja23yHX
 IwlsIAGPa5e65YTMQHYS2atWfyUnxBaBZcf7eX3ikf4bg2i62CsiT+8uZKj5gZ8Z6f9j
 5Lkqt8aveTvjiX84Ep+QpuivgQboLi8NvS5D1oa8CLtPoPiEWho9PgxPTTUR1i9YHexk
 QgrsUMjmkEfNORRSG9iu4tJQCGbkwVlyVjL/jXx5H22IyTzAIbuXaIXt+Lojql+0cfSs
 NaIbb1SRTd+s+Ht/uPLO+5d9WD61b4bphB31xx667V3TcQgf2H+3npRoeu9WWM+HkdGS cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3edg9p05q5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:43:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D765110002A;
 Wed, 23 Feb 2022 08:43:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0E392138F0;
 Wed, 23 Feb 2022 08:43:30 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 23 Feb
 2022 08:43:30 +0100
Message-ID: <77274ad3-43f9-16c4-0d35-c6db573af1d8@foss.st.com>
Date: Wed, 23 Feb 2022 08:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220201143716.1.I772b37f5f94142644b1fb45549e80239a8101263@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220201143716.1.I772b37f5f94142644b1fb45549e80239a8101263@changeid>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-23_02,2022-02-21_02,2021-12-02_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] board: st: common: update test on
 misc_read result in command stboard
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

Hi Patrick

On 2/1/22 14:37, Patrick Delaunay wrote:
> Update management of misc_read/misc_write, which now returns length of
> data after the commit 8729b1ae2cbd ("misc: Update read() and write()
> methods to return bytes xfered"): raise a error when the result is not
> the expected length.
> 
> Fixes: 658fde8a36ff ("board: stm32mp1: stboard: lock the OTP after programming")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/common/cmd_stboard.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
> index 2fba383168..c1ecd643b0 100644
> --- a/board/st/common/cmd_stboard.c
> +++ b/board/st/common/cmd_stboard.c
> @@ -91,14 +91,14 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
>  	ret = misc_read(dev, STM32_BSEC_OTP(BSEC_OTP_BOARD),
>  			&otp, sizeof(otp));
>  
> -	if (ret < 0) {
> +	if (ret != sizeof(otp)) {
>  		puts("OTP read error");
>  		return CMD_RET_FAILURE;
>  	}
>  
>  	ret = misc_read(dev, STM32_BSEC_LOCK(BSEC_OTP_BOARD),
>  			&lock, sizeof(lock));
> -	if (ret < 0) {
> +	if (ret != sizeof(lock)) {
>  		puts("LOCK read error");
>  		return CMD_RET_FAILURE;
>  	}
> @@ -172,7 +172,7 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
>  	ret = misc_write(dev, STM32_BSEC_OTP(BSEC_OTP_BOARD),
>  			 &otp, sizeof(otp));
>  
> -	if (ret < 0) {
> +	if (ret != sizeof(otp)) {
>  		puts("BOARD programming error\n");
>  		return CMD_RET_FAILURE;
>  	}
> @@ -181,7 +181,7 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
>  	otp = 1;
>  	ret = misc_write(dev, STM32_BSEC_LOCK(BSEC_OTP_BOARD),
>  			 &otp, sizeof(otp));
> -	if (ret < 0) {
> +	if (ret != sizeof(otp)) {
>  		puts("BOARD lock error\n");
>  		return CMD_RET_FAILURE;
>  	}
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
