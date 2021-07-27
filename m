Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D73D71B8
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Jul 2021 11:11:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B67DFC597B7;
	Tue, 27 Jul 2021 09:11:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB263C597AB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 09:11:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16R96C3O022994; Tue, 27 Jul 2021 11:11:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=I5vz2xMFGtIsdUY7m2EyzHQEEAd/rWDswVapn9s5dys=;
 b=G1k5zc+XAUiNn/+HDa3IXMrzwXu9XulzWYakOXd8USeFoivjPb24WqYHVtRTWYnf9y5T
 yEhejfPC05LR+lju95Br2muTLFTDuRF9Gs9SmP2Q0Onq9WKt9/XmP93LazH/2NbtDVvE
 u+X4EuD0G6pBJknSemvOUCoFVe/X/1f4De8xM1/R4nevyECgbc/N5JBZxxfA1iN+u78Q
 c+UvO1g8wY95RgexVOnAqx2xClwo4hdUu1twpbrLsAAR4KAMCBVVdX5MDC093GVFEEgo
 M2AhYIYEIX4cOymw0cfLklX6e8MQqHk6rJLOjw/gCEcO0CGLeFGTbP2Ucyck9R3uEKQO mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a235hu7ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 11:11:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C49B510002A;
 Tue, 27 Jul 2021 11:11:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B50D721BF41;
 Tue, 27 Jul 2021 11:11:07 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Jul
 2021 11:11:07 +0200
To: <u-boot@lists.denx.de>
References: <20210709142429.1.I9f0b06646bc5c9c2a673537caa8f5364e39793b3@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <6f570c18-4853-1691-7dc6-7b4fa390af8d@foss.st.com>
Date: Tue, 27 Jul 2021 11:11:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709142429.1.I9f0b06646bc5c9c2a673537caa8f5364e39793b3@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_06:2021-07-27,
 2021-07-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32mp1: add support of missing SPI
	clocks
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

On 7/9/21 2:24 PM, Patrick Delaunay wrote:
> Add the missing SPI clock even if these instances are not available
> on STMicroelectronics boards: SPI2_K, SPI3_K, SPI4_K, SPI6_K.
>
> With this patch, the SPI2 / SPI3 / SPI4 / SPI6 instances can be used on
> customer design without the clock driver error:
>    stm32mp1_clk_get_id: clk id 131 not found
>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   drivers/clk/clk_stm32mp1.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
