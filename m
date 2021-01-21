Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E782FE5BA
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Jan 2021 10:04:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 668EDC3FADA;
	Thu, 21 Jan 2021 09:04:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAAA1C3FAD8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jan 2021 09:04:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10L92QNG023875; Thu, 21 Jan 2021 10:02:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EYXllIh3Q5EMjBxcGkV6vZYLkmoQLA01OtVlRoEU5nw=;
 b=HxQsF13OASfXDg3jCiF7oTC8/Tqs3mv3kgreZwcHg59uU5aICs4wiMZ4n/UibsIKLxVp
 uwQ6cvt8fz1yTuGjDWiM+SozesMGbeagS4brNTc2XfPfRnQ93fiXTR29naTn97XZrmIl
 lucn0ABMDl6INApCC2g+iFnPjMhpcYhqwAF+JAHRcZnj5gDpfXb6qKHFlxH6nw9nr4BU
 eTXvraouqXesM+8KRIhgRM+PMf+znmH/NDRj9IEMKRSBjjwcaYvzcpnQpgKj9egu1zgz
 hw0CXAjjRkhaBJlIjyxE8Sf/e60erZdo92vdSntGBKVbwDODfkyyKM7u1vgL7olSN4Mi Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pqa03d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 10:02:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A64A100034;
 Thu, 21 Jan 2021 10:01:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 465B722179E;
 Thu, 21 Jan 2021 10:01:29 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Jan
 2021 10:01:28 +0100
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20210115140500.846307-1-sjg@chromium.org>
 <20210115140500.846307-3-sjg@chromium.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <8a8a4f44-7fcb-cee2-bb7d-9e174e996549@foss.st.com>
Date: Thu, 21 Jan 2021 10:01:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115140500.846307-3-sjg@chromium.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_04:2021-01-20,
 2021-01-21 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Walter Lozano <walter.lozano@collabora.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Heiko Schocher <hs@denx.de>,
 Dario Binacchi <dariobin@libero.it>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 02/15] dm: gpio: Rename set_dir_flags()
 method to update_flags()
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

Hi Simon,

On 1/15/21 3:04 PM, Simon Glass wrote:
> The current method is a misnomer since it is also used (e.g. by stm32) to
> update pull settings and open source/open drain.
>
> Rename it and expand the documentation to cover a few more details.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
>   drivers/gpio/gpio-uclass.c      | 16 ++++++++--------
>   drivers/gpio/sandbox.c          |  6 +++---
>   drivers/gpio/stm32_gpio.c       |  6 +++---
>   drivers/pinctrl/pinctrl-stmfx.c |  6 +++---
>   include/asm-generic/gpio.h      | 30 ++++++++++++++++++++++++------
>   test/dm/gpio.c                  |  8 ++++----
>   6 files changed, 45 insertions(+), 27 deletions(-)
>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
