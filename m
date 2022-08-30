Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 072795A6307
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Aug 2022 14:16:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF0EAC57B6C;
	Tue, 30 Aug 2022 12:16:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93AEAC03FD4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 12:16:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U9VNA5004872;
 Tue, 30 Aug 2022 14:16:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fX/F8v/gizxNZFsVrLm2OuKT/AAybvddrSJtuSuUjYU=;
 b=HHFMixTMTr5kZvqzqubsl/cQtrudQzywKLQCPLs7peU+0t5k65oqg3H2sr7ppKG0e6Fm
 kwoIXJ36tNlPDbV39mmsqIuktORJ1HcTQJwGeIjpZF53sQ/Ktw8XXDRx8l/GN4h2FipC
 wU1Woo6NimgPey0Fs8LINC/J4AhF1xJKBfczN87O3yBWS7kUlqOFePKnFeYMuJIOaZLa
 gDretGtum3kN09YfaJhKufzxvgkgrAVeYtiKaCSda7eWdna9AEFgKNcnDw+k7WlU9aY0
 SpCNyo/6JSE/fDxPEqwQ2KwtGeQiQEYNNw8KQONUyhd3li+KM1wuhuUw0iRs8/I/DkEy kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j7a5hyw50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 14:16:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3588F10002A;
 Tue, 30 Aug 2022 14:16:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2DA62226FDC;
 Tue, 30 Aug 2022 14:16:09 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.51) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 30 Aug
 2022 14:16:07 +0200
Message-ID: <6079540a-c2c0-c87a-c96c-ab15115879a6@foss.st.com>
Date: Tue, 30 Aug 2022 14:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
 <20220830120914.2329522-2-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220830120914.2329522-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_06,2022-08-30_01,2022-06-22_01
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Eddie James <eajames@linux.ibm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/4] gpio: Allow to print pin's label
 even for pin with GPIOF_FUNC function
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

Hi Patrice

On 8/30/22 14:09, Patrice Chotard wrote:
> Currently, if pin's function is GPIOF_FUNC, only "func" if displayed
> without any other information. It would be interesting, if information is
> available, to indicate which pinmuxing's name is used.
>
> For example, for STM32 SoC's based platform, "gpio status" command
> output :
>
>     before
>      Bank GPIOZ:
>        GPIOZ0: unused : 0 [ ]
>        GPIOZ1: unused : 0 [ ]
>        GPIOZ2: unused : 0 [ ]
>        GPIOZ3: unused : 0 [ ]
>        GPIOZ4: func
>        GPIOZ5: func
>        GPIOZ6: unused : 0 [ ]
>        GPIOZ7: unused : 0 [ ]
>        GPIOZ8: unknown
>        GPIOZ9: unknown
>        GPIOZ10: unknown
>        GPIOZ11: unknown
>        GPIOZ12: unknown
>        GPIOZ13: unknown
>        GPIOZ14: unknown
>        GPIOZ15: unknown
>
>     After
>      Bank GPIOZ:
>        GPIOZ0: unused : 0 [ ]
>        GPIOZ1: unused : 0 [ ]
>        GPIOZ2: unused : 0 [ ]
>        GPIOZ3: unused : 0 [ ]
>        GPIOZ4: func i2c4-0
>        GPIOZ5: func i2c4-0
>        GPIOZ6: unused : 0 [ ]
>        GPIOZ7: unused : 0 [ ]
>        GPIOZ8: unknown
>        GPIOZ9: unknown
>        GPIOZ10: unknown
>        GPIOZ11: unknown
>        GPIOZ12: unknown
>        GPIOZ13: unknown
>        GPIOZ14: unknown
>        GPIOZ15: unknown
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> ---
>
> Changes in v3:
>     - add lost Simon Glass's reviewed-by during v1 review
>
>   drivers/gpio/gpio-uclass.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
