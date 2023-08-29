Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB2978C872
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Aug 2023 17:19:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA1D7C65E4C;
	Tue, 29 Aug 2023 15:19:38 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 470F0C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 15:19:37 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37TC3oEg012175; Tue, 29 Aug 2023 17:19:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=e2OR5bsxeDP0uYfdJtMuQRNoi7UTFpBxVX+LFy7TJz8=; b=Zd
 KaoL5FNDVFT+GarHDEImgff+/s/zLBWvSxdFDHweyvK/hHVoCTkToVINpsZdyA3N
 +l71yzr9WTWgDqhvmUdM9Ir1QHCJM6pzzlI5mr0C2ho+E6ZZfqxHVUXBo1mJFHNJ
 STIMznYFkEYTMrWpcyUyHjZ2KhD5q9vTSlJN+6r+UrdH5EoA99tQMQonEoo//w+I
 b9gvd4+NMS14mm2cwfd1B4NTXRn2Vrsp/eJqsH2Kz1QlGxJZMbzFJ3HCzkLoU0zq
 dIs9vaP+yZA04oofT54sCoPGAtmZsxy6exbBOb9TvNmhRh9CrXFnzbfP3vOw1VQ+
 8PcP5UyISx8ouP9C+Alg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sqvbhagc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 17:19:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1E70100057;
 Tue, 29 Aug 2023 17:19:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7D69233018;
 Tue, 29 Aug 2023 17:19:34 +0200 (CEST)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 29 Aug
 2023 17:19:34 +0200
Message-ID: <e7e8f2cd-b9f0-96cb-a4af-fc729189a35e@foss.st.com>
Date: Tue, 29 Aug 2023 17:19:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230820162446.616442-1-dario.binacchi@amarulasolutions.com>
 <20230820162446.616442-2-dario.binacchi@amarulasolutions.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230820162446.616442-2-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_13,2023-08-29_01,2023-05-22_02
Cc: yannick fertre <yannick.fertre@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] board: stm32f746-disco: refactor the
 display of the ST logo
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

Hi

On 8/20/23 18:24, Dario Binacchi wrote:
> The patch removes the legacy mode of displaying the ST logo and adopts
> the approach introduced by the commit 284b08fb51b6 ("board: stm32mp1: add
> splash screen with stmicroelectronics logo"). It was necessary to use a
> specific logo for the stm32f746-disco board.
>
> Furthermore, the previous version didn't properly center the logo, hiding
> its upper part.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
>   board/st/stm32f746-disco/stm32f746-disco.c |   6 ------
>   configs/stm32f746-disco_defconfig          |   2 +-
>   configs/stm32f746-disco_spl_defconfig      |   2 +-
>   include/configs/stm32f746-disco.h          |   7 ++++++-
>   tools/logos/stm32f746-disco.bmp            | Bin 0 -> 18052 bytes
>   5 files changed, 8 insertions(+), 9 deletions(-)
>   create mode 100644 tools/logos/stm32f746-disco.bmp
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
