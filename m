Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C62EBF9C
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Jan 2021 15:30:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46706C56634;
	Wed,  6 Jan 2021 14:30:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71984C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jan 2021 14:30:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 106ER6gq016128; Wed, 6 Jan 2021 15:30:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2JdH41/AGSg2Rus4qGHV5dtnNC9O839wHXDrgmidjD0=;
 b=PGVf68BdIiyK94A0YKatKgjvgCB/3dvx/n2+ZcJ6Ys3OkPAS3dLFmt2kfreZw5HDlnRq
 rhr9KhfFeL6lwoP6g5NgyfJkYZVCYEc6YoDPWNicWOVBffB3zJR0wH+6e31xDPNcgmR3
 n5nFORMt1GxO6j7qqQHsJzrIJM9JZnagc9AxbecV1T+o0pbaQr6VNs0P4/+PFdNcKNqk
 rwfMVOB8zi9D0/SEM7wIMfLI458RWiKX1nMdJj5k0F/IupchSZj3rMDWrWRYlsZwHe06
 APNZqcYAo/OvZDudjqtRQjMjwsVJOPJ91vMVHITbD6YP/oYkEbrOiC5bdaq8ep+jCbU5 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35th25u76t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 15:30:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FD7F10002A;
 Wed,  6 Jan 2021 15:30:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 535032C38C9;
 Wed,  6 Jan 2021 15:30:49 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Jan
 2021 15:30:48 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210104160056.4271-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <e3586eaf-6214-5304-334a-12dfaaaefa15@foss.st.com>
Date: Wed, 6 Jan 2021 15:30:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104160056.4271-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_06:2021-01-06,
 2021-01-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] MAINTAINERS: Update STi and STM32
 maintainers emails in remaining files
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

On 1/4/21 5:00 PM, Patrice Chotard wrote:
> A previous series already update STMicroelectronics emails maintainers
> but some files have been omitted (Makefile, .dts, .dtsi and .rst files).
> Update Patrick and my email address with the one dedicated to upstream
> activities.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/stih410-b2260-u-boot.dtsi    | 2 +-
>   arch/arm/dts/stih410-b2260.dts            | 2 +-
>   arch/arm/dts/stm32429i-eval-u-boot.dtsi   | 2 +-
>   arch/arm/dts/stm32f429-disco-u-boot.dtsi  | 2 +-
>   arch/arm/dts/stm32f469-disco-u-boot.dtsi  | 2 +-
>   arch/arm/dts/stm32h743i-disco.dts         | 2 +-
>   board/st/common/MAINTAINERS               | 2 +-
>   board/st/stih410-b2260/MAINTAINERS        | 2 +-
>   board/st/stih410-b2260/Makefile           | 2 +-
>   board/st/stm32f429-evaluation/MAINTAINERS | 2 +-
>   board/st/stm32f429-evaluation/Makefile    | 2 +-
>   board/st/stm32f469-discovery/MAINTAINERS  | 2 +-
>   board/st/stm32f469-discovery/Makefile     | 2 +-
>   board/st/stm32h743-disco/MAINTAINERS      | 2 +-
>   board/st/stm32h743-disco/Makefile         | 2 +-
>   board/st/stm32h743-eval/MAINTAINERS       | 2 +-
>   board/st/stm32h743-eval/Makefile          | 2 +-
>   board/st/stm32mp1/MAINTAINERS             | 2 +-
>   doc/board/st/stm32mp1.rst                 | 2 +-
>   doc/driver-model/bind.rst                 | 2 +-
>   20 files changed, 20 insertions(+), 20 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
