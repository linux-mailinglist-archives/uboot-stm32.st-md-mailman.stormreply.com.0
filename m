Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F6E2D30FE
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Dec 2020 18:27:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 144CCC3FADE;
	Tue,  8 Dec 2020 17:27:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F682C3FADB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Dec 2020 15:24:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B7FBvI5025495; Mon, 7 Dec 2020 16:24:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nVcxLwPM7jOhwu1iZVfheKuZa2NKCxrk5Mba52V8Z8Y=;
 b=kT6+xr7RBOCXFxfXwKXaWAKmYaf8zV5QJ/pEZn8IqYDiFljMQPgVNmIJS3cvecumjvQ8
 wy8acEfBKYtwmnQlaEMGwrmTy3rLMqtKOrjMQYH04TWc9fY3K3OzF/+b+CCaFrFFQZsV
 xkxeldha1a/ofeMHH8rhd3Q79AjSqng5ZkZOQErjdvy8cLIpZDVvAqrBIVKrZMeeAWbr
 bLCYu6pN4xnTLFsWwBbVn0xhgodMFk1MqWJHfGt9qN+EHm5ysz3ze8lBTrMOWoupjXaD
 jnicajk4kEvRLZO7rg+poEI9EvTaYyZMw6ih/om1Kce4BRkHrbzHBaV4qfneyujE+/0i Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3583n63cry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 16:24:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1D7210045C;
 Mon,  7 Dec 2020 16:08:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8FC92BA2BB;
 Mon,  7 Dec 2020 16:08:41 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Dec
 2020 16:08:41 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Mon, 7 Dec 2020 16:08:41 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD - foss <patrice.chotard@foss.st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 2/3] treewide: Update email address Patrick Delaunay
 and Patrice Chotard
Thread-Index: AQHWyNM6rp6IY4cGJ0ezHBnT4VJMEanrw+pQ
Date: Mon, 7 Dec 2020 15:08:41 +0000
Message-ID: <b32d8907c0514523a5f06ac33d4e34f0@SFHDAG2NODE3.st.com>
References: <20201202174731.9503-1-patrice.chotard@foss.st.com>
 <20201202174731.9503-2-patrice.chotard@foss.st.com>
In-Reply-To: <20201202174731.9503-2-patrice.chotard@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_11:2020-12-04,
 2020-12-07 signatures=0
X-Mailman-Approved-At: Tue, 08 Dec 2020 17:27:52 +0000
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Patrick
 DELAUNAY - foss <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Anatolij
 Gustschin <agust@denx.de>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] treewide: Update email address
 Patrick Delaunay and Patrice Chotard
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrice,

> From: Patrice CHOTARD - foss <patrice.chotard@foss.st.com>
> Sent: mercredi 2 d=E9cembre 2020 18:48
> =

> Update Patrick and my email address with the one dedicated to upstream
> activities.
> =

> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> =

> (no changes since v1)
> =

>  arch/arm/include/asm/arch-stih410/sdhci.h            | 2 +-
>  arch/arm/include/asm/arch-stih410/sys_proto.h        | 2 +-
>  arch/arm/include/asm/arch-stm32/stm32f.h             | 2 +-
>  arch/arm/include/asm/arch-stm32f4/stm32_pwr.h        | 2 +-
>  arch/arm/include/asm/arch-stm32f7/stm32_pwr.h        | 2 +-
>  arch/arm/include/asm/arch-stm32h7/gpio.h             | 2 +-
>  arch/arm/include/asm/arch-stm32h7/stm32.h            | 2 +-
>  arch/arm/mach-stm32/soc.c                            | 2 +-
>  board/st/stih410-b2260/board.c                       | 2 +-
>  board/st/stm32f429-evaluation/stm32f429-evaluation.c | 2 +-
>  board/st/stm32f469-discovery/stm32f469-discovery.c   | 2 +-
>  board/st/stm32h743-disco/stm32h743-disco.c           | 2 +-
>  board/st/stm32h743-eval/stm32h743-eval.c             | 2 +-
>  drivers/clk/clk_stm32h7.c                            | 2 +-
>  drivers/misc/stm32_rcc.c                             | 2 +-
>  drivers/mmc/sti_sdhci.c                              | 2 +-
>  drivers/mmc/stm32_sdmmc2.c                           | 2 +-
>  drivers/phy/sti_usb_phy.c                            | 2 +-
>  drivers/pinctrl/pinctrl-sti.c                        | 2 +-
>  drivers/reset/sti-reset.c                            | 2 +-
>  drivers/reset/stm32-reset.c                          | 2 +-
>  drivers/serial/serial_sti_asc.c                      | 2 +-
>  drivers/sysreset/sysreset_sti.c                      | 2 +-
>  drivers/timer/sti-timer.c                            | 2 +-
>  drivers/timer/stm32_timer.c                          | 2 +-
>  drivers/usb/host/dwc3-sti-glue.c                     | 2 +-
>  drivers/video/backlight_gpio.c                       | 2 +-
>  include/configs/stih410-b2260.h                      | 2 +-
>  include/configs/stm32f429-evaluation.h               | 2 +-
>  include/configs/stm32f469-discovery.h                | 2 +-
>  include/configs/stm32h743-disco.h                    | 2 +-
>  include/configs/stm32h743-eval.h                     | 2 +-
>  include/dwc3-sti-glue.h                              | 2 +-
>  include/stm32_rcc.h                                  | 2 +-
>  34 files changed, 34 insertions(+), 34 deletions(-)
> =


Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
