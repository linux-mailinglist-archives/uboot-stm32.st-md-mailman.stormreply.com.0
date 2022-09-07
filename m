Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E118B5B052F
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Sep 2022 15:33:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A77ECC63324;
	Wed,  7 Sep 2022 13:33:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C084C62D6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 13:33:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2879DLbC018624;
 Wed, 7 Sep 2022 15:33:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rKuciG4QZl8IkW2ZcR9eNAQkNkvSHvIcBzMPQEJHxnk=;
 b=Qm36kT0/uENySp15T3X+mzKqcKKCVIwNQvcU3OziorYcE4tDYuc1oZl2MdprGrXg8NOg
 MEXMV/8RrenS+p51tlQjGYTKIbFBw93qNuC+Uva1KGdwrEWR6wjY9JXhywyGdKRy0Kw5
 zDJH2MyD5Aii48SNF0lELED/6Cmj9m9ykX0fILDmgnJkHzwVnHbvFpepHzAO8/ZLXpwi
 DS2HFwS6axdRvSeB5Rw8o8uln7zW4NsQCcFWO45uVPTlXwsOeCLFnqKFYrWLEREQrMOO
 /HqRJCm9+ASLgZPmlTDF284Yl4MFOc19A1Lf6PuWKNhjHPwYtbR4NyMgvXrjDGLjvSK3 IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jerfv1k9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 15:33:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1E7E10002A;
 Wed,  7 Sep 2022 15:33:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE01122A6EF;
 Wed,  7 Sep 2022 15:33:48 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.49) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 7 Sep
 2022 15:33:47 +0200
Message-ID: <d89b79d3-b66d-d205-c797-ba5c76b04ab9@foss.st.com>
Date: Wed, 7 Sep 2022 15:33:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220824134440.1091826-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220824134440.1091826-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_08,2022-09-07_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32: Enable
 CONFIG_DM_REGULATOR for stm32f769-disco
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

On 8/24/22 15:44, Patrice Chotard wrote:
> Since commit 5bc6f8c2a97e("video: stm32: remove test on CONFIG_DM_REGULATOR")
> backlight was broken with the following message at boot:
> stm32-display-dsi dsi@40016c00: Warning: cannot get phy dsi supply
> stm32_display display-controller@40016800: panel panel enable backlight error -38
>
> DM_REGULATOR flag must be enabled to fix this issue
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   configs/stm32f769-disco_defconfig     | 1 +
>   configs/stm32f769-disco_spl_defconfig | 1 +
>   2 files changed, 2 insertions(+)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
