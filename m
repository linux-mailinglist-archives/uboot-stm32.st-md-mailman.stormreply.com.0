Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE02FE5BB
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Jan 2021 10:04:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74882C3FADA;
	Thu, 21 Jan 2021 09:04:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6847C3FAD8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jan 2021 09:04:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10L8vE07027871; Thu, 21 Jan 2021 10:02:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RGAB+Ot9JZ+yiKH5OR1JbjkA4HEeA/48huz7HaiyNu4=;
 b=PNIBfy6m0YywRFAPw4DjQ6uMoUXQFgxk8/liGkm3rrP+CClWj03chXW2uTt5VDikjAUD
 tD0EY54kcCmDNFNQ0lCOu2xd/DD9BbLBmqujNjTXD3X0GKs9j6+cK1aGGs1iGCanWx9/
 kznSyFs94QJ5fP654Z5srGkyuGjYZyfHTv/0xxpF6UOLpGTHBye37ei5QVBqz4wjQ9IN
 KUZgxZTGHRNsjed9i2BaEKOqoZMtzdZJcjjc49S8bWGANcLzZMlADsbeGhuCqhOKnOT+
 0Wrc8PPtPFwTTKpsm4P8nGwyBfN/q3g2KIk16Vpl2l/UXobIacO+5fQN0JiScUC8biYI Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668p51yd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 10:02:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 418C910002A;
 Thu, 21 Jan 2021 10:02:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25CE2221F78;
 Thu, 21 Jan 2021 10:02:57 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Jan
 2021 10:02:55 +0100
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20210115140500.846307-1-sjg@chromium.org>
 <20210115140500.846307-4-sjg@chromium.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <fbd0b77a-93fa-d7ef-a6ea-ae92b846cb4a@foss.st.com>
Date: Thu, 21 Jan 2021 10:02:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115140500.846307-4-sjg@chromium.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
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
Subject: Re: [Uboot-stm32] [PATCH 03/15] dm: gpio: Rename get_dir_flags()
 method to get_flags()
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
> It is more useful to be able to read all the flags, not just the direction
> ones. In fact this is what the STM32 driver does. Update the method name
> to reflect this.
>
> Tweak the docs a little and use 'flagsp' as the return argument, as is
> common in driver model, to indicate it returns a value.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
>   drivers/gpio/gpio-uclass.c      | 30 +++++++++++++++---------------
>   drivers/gpio/sandbox.c          |  8 ++++----
>   drivers/gpio/stm32_gpio.c       |  8 ++++----
>   drivers/pinctrl/pinctrl-stmfx.c |  8 ++++----
>   include/asm-generic/gpio.h      | 13 +++++++------
>   5 files changed, 34 insertions(+), 33 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
