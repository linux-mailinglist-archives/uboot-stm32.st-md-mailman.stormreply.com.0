Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD23779A711
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Sep 2023 11:55:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D18DC6B46F;
	Mon, 11 Sep 2023 09:55:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 360F9C6B46E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 09:54:59 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38B9Svqs029033; Mon, 11 Sep 2023 11:54:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=gX6TtxL0r5hSRLM+sytZiMTVaKsrQv/zHA2pP17q4No=; b=2h
 xtYz+VlQFWFvc14nXwfssTEZ9E989ADH3zGhmdPEFzb7Qh4OHFqDrre5gbfhBQKy
 wmlgx0Z1s38bes5JYCapKqY9GWxCUIDbYg2kcnKGhg8NlzYMGayCsYCGJjmR9OLL
 xaDPcux1XqN6CoZRZod+WzSBpRjb+8ZpDCTYgnrEm+x+uDiJLdkcZC/qKeQag7oG
 Q8/KCCfV2hkl7JSwaI3mxCnV9EAfRWph6J/VyKVjF6Fxdj8IxXy7B7r0DVIIpl6g
 eMD+2r5oiHagleeG/Mlr28mDqGqfU1MUXIlgqs8Fx7hDhjuyPepMVvzRLsFhyu4J
 MI3/Rlixcto8opY2Sl7w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t0e4fqm5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 11:54:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6651C100061;
 Mon, 11 Sep 2023 11:54:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DBDE23A171;
 Mon, 11 Sep 2023 11:54:57 +0200 (CEST)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 11:54:56 +0200
Message-ID: <51f5824a-6f9d-c617-f7ff-1c67a7879fe5@foss.st.com>
Date: Mon, 11 Sep 2023 11:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, <u-boot@lists.denx.de>
References: <20230907162200.205602-1-gatien.chevallier@foss.st.com>
 <20230907162200.205602-5-gatien.chevallier@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230907162200.205602-5-gatien.chevallier@foss.st.com>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 5/7] rng: stm32: add error concealment
	sequence
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

On 9/7/23 18:21, Gatien Chevallier wrote:
> Seed errors can occur when using the hardware RNG. Implement the
> sequences to handle them. This avoids irrecoverable RNG state.
>
> Try to conceal seed errors when possible. If, despite the error
> concealing tries, a seed error is still present, then return an error.
>
> A clock error does not compromise the hardware block and data can
> still be read from RNG_DR. Just warn that the RNG clock is too slow
> and clear RNG_SR.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   drivers/rng/stm32_rng.c | 163 ++++++++++++++++++++++++++++++++++------
>   1 file changed, 140 insertions(+), 23 deletions(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
