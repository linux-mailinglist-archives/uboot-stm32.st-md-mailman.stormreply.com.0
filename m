Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EE8338934
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 10:50:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9DD4C57183;
	Fri, 12 Mar 2021 09:50:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B29FC56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 09:50:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12C9hAOm023324; Fri, 12 Mar 2021 10:50:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4KMpVh+EGY9Mt9Sm9Fl0tJCow1H1oSyexoNXJii3CXE=;
 b=YGkze0nfc1rqLTbWoIBM1RxjWfvEJR3mRUBcifxQ6Iv0UH/ZSbOt3C/W0zy0c+gw5Qr+
 5TmrU4w1wbrxp9+cbTIwMVQgNOkdR6MzrGqzDF6Ls+x0XplSyE+wIgZPlV0uS9LdRS/X
 ee9d048c8jNC+cGcF1xsYWnwyUYNUu/tXZzamSRVZouac7plAaRlSISK52xI+zM6z6tZ
 gRKgUtJCdydcyifVja4hmVgAZSQfFqOBoWLWbeOnmz2IKD9tgoQwg49j9ppohwol/L+e
 IVLgI2Ba+aK8LsXE5Aq7Qu0aL+XHZfb92rhNqjwsU05oROP6vJIkaBsFVYFqvQBZtsB4 mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf5026-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 10:50:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E6C5100034;
 Fri, 12 Mar 2021 10:50:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13369231DFF;
 Fri, 12 Mar 2021 10:50:42 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 10:50:41 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224123821.22848-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <a6449bd4-b0e3-8cb6-ed23-bc0d0389e137@foss.st.com>
Date: Fri, 12 Mar 2021 10:50:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224123821.22848-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>, Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] configs: stm32: Remove
 BOARD_EARLY_INIT_F and BOARD_LATE_INIT for stm32 boards
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

Hi Patrice,

On 2/24/21 1:38 PM, Patrice Chotard wrote:
> These flags was defined and callbacks linked to these flags are empty
> and only returning 0.
> Remove BOARD_EARLY_INIT_F and BOARD_LATE_INIT flags for these stm32 boards.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   configs/stm32f429-discovery_defconfig  | 1 -
>   configs/stm32f429-evaluation_defconfig | 1 -
>   configs/stm32f469-discovery_defconfig  | 1 -
>   configs/stm32f746-disco_defconfig      | 1 -
>   configs/stm32f769-disco_defconfig      | 2 --
>   configs/stm32h743-disco_defconfig      | 2 --
>   configs/stm32h743-eval_defconfig       | 2 --
>   7 files changed, 10 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
