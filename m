Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA06E2F46F2
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jan 2021 09:58:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D539C424BE;
	Wed, 13 Jan 2021 08:58:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49704C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 08:58:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10D8tvjb019246; Wed, 13 Jan 2021 09:58:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=R1StQ3E/chMMixnbd3e1A9TtlJBc3E7aVESg0sz1HN8=;
 b=Cq7n/DUWpFN7bYMP/61z8gHk7LpMvUjj94JQkvc1wa+j5owhw/dMm4rzq7HczTACDKnj
 FAoymsVQTdP2h1Ozu72x9u/6QpoPYEfbCu/ChTb+YEeqWKzZJjl/cg5oTuMJKxswau6F
 ECmwx/USWu7/GQHG9aGQWpc4J1SNXwtDxQR+H7gwABZSM5gDk0NWry80JuUMn+0rEs2I
 uZIkCkERSSAcGktc68Iftr84P0+Fe/yz8h0xLmQW4FmGcfWXpVHl5m8JCfnPltGlWt6w
 7zdTYIqGOsTrD0SqRPArpvd6S1UAyf6KKtsHMDIxUInDsGXG0wh6COQx5nn+9Q3vt7pj Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5h2n90y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 09:58:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1FE6910002A;
 Wed, 13 Jan 2021 09:58:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 159842283E7;
 Wed, 13 Jan 2021 09:58:53 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Jan
 2021 09:58:52 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210104160056.4271-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <b26fc2f6-e802-9ff6-adf8-4cb030931761@foss.st.com>
Date: Wed, 13 Jan 2021 09:58:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104160056.4271-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_03:2021-01-13,
 2021-01-13 signatures=0
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
Applied to u-boot-stm/master, thanks!

Regards

Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
