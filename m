Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57606426481
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 08:15:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 147D2C597B2;
	Fri,  8 Oct 2021 06:15:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0378BC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 06:15:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984ZqYu022672; 
 Fri, 8 Oct 2021 08:14:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pRMEt5TysU1qOY7DzBlZJ6iSD0V17AhXcQChLN+QBTw=;
 b=SbQ4sfIWPKkyU+K7AqvOa/KSEJ9C3BR/pNiSPlpjbWJHerhaAYrCdGTibX61P2id2le4
 I1fGVEJGS3UV3pXTeYy11QXt3FCREYF4vlyqNoGGa3Zpa4f8EF6d1FMqk+4uJfkQw7Gi
 0hV86rUdjfEN5ytLZ5W7XGrJdoXgtGgMDYbJ2V4D5SwOI7sZU87wphmh5EPsqKrZ192I
 qWQiHDgnNhb3YmCgqccKp3HxjGCvRzQY6bdqTH38E0PBsSAEatH6M3Tspg7GWS6iWQ/K
 I5oWri2dOV3kR/jP734TLIBHu3e6hJ7seYt6MQU8ftG4v0z/p1wrjDtpRVAncgKRoqbc wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjbxn9ek2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:14:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41EA710002A;
 Fri,  8 Oct 2021 08:14:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36A9B212FC3;
 Fri,  8 Oct 2021 08:14:03 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 08:14:02 +0200
To: <u-boot@lists.denx.de>
References: <20210910141624.25133-1-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <4ff0ce38-71f2-4b33-394e-a5774a4773c4@foss.st.com>
Date: Fri, 8 Oct 2021 08:14:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910141624.25133-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Bin Meng <bin.meng@windriver.com>, Sean Anderson <seanga2@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Pratyush Yadav <p.yadav@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Nandor Han <nandor.han@vaisala.com>
Subject: Re: [Uboot-stm32] [RESEND][PATCH v2 0/5] cmd: bind: Fix driver
	binding
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

Hi

If anybody has objection, i will add this series to the next STM32 pull request as this series is still not
merged since April.

Thanks 
Patrice


On 9/10/21 4:16 PM, Patrice Chotard wrote:
> 
> This series is fixing issues reported by Herbert Poetzl when trying to
> bind Ethernet gadget over USB on STM32MP1 platform.
> 2 issues have been found:
>   - fix the bind command.
>   - add dwc2 bcdDevice in USB gadget controller.
>   - add test to check binding of driver without compatible string.
> 
> Changes in v2:
>    - add bind test
> 
> Patrice Chotard (5):
>   cmd: bind: Fix driver binding on a device
>   usb: gadget: Add bcdDevice for the DWC2 USB Gadget Controller
>   usb: sandbox: Add gadget callbacks
>   configs: sandbox: add USB_ETHER and GADGET_DOWNLOAD gadget support
>   test/py: Add usb gadget binding test
> 
>  cmd/bind.c                        |  2 +-
>  configs/sandbox_defconfig         |  3 +++
>  drivers/core/device.c             |  2 +-
>  drivers/core/lists.c              | 11 ++++++++---
>  drivers/core/root.c               |  2 +-
>  drivers/misc/imx8/scu.c           |  2 +-
>  drivers/serial/serial-uclass.c    |  2 +-
>  drivers/timer/timer-uclass.c      |  2 +-
>  drivers/usb/gadget/gadget_chips.h |  8 ++++++++
>  drivers/usb/host/usb-sandbox.c    | 28 ++++++++++++++++++++++++++++
>  include/dm/lists.h                |  3 ++-
>  test/dm/nop.c                     |  2 +-
>  test/py/tests/test_bind.py        |  7 +++++++
>  13 files changed, 63 insertions(+), 11 deletions(-)
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
