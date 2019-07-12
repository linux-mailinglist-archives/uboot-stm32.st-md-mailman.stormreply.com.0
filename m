Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7198670F4
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 16:03:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84135D41424
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:03:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E90DFD41421
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 14:03:41 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CE1SSN029208; Fri, 12 Jul 2019 16:03:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=RkSNX1iHqUGgd8nmI6id32uTQyzKw2blKHDUJSJaSNA=;
 b=Jvjvx7p1HBy/k/gQ1gnN1m0mpWiWhswR08iQZwUgKkRxk5jSElrgL6uprq4Yu8+DGxZp
 SdR+4KM1ieqnP3s6O4JqjzF4uZtO/R51qIcPYT8qupbPvBqc6qAlhaK2vqpo6G803ufg
 NCdO7xfTU/zyzvFbgkUBYdaYbPQ4uXNGSDi1TO/CzSyhodioDrxlBRFp5Y8GXpHxVARu
 8G79V6orh7hRofDZaIsjpa20fF+ViPN799zQOGnJ00keUwPawSB7uwaM3tqK1dyTDRJJ
 XJaej4rOGE7+EgPMoxZB8lmxHuY15Wz5nN9e3AR2UkxsSx03x+jZlgS+m/t1qu62DpN6 wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tpj3tkenh-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 16:03:40 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B4093A;
 Fri, 12 Jul 2019 14:03:40 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25A0A4E68;
 Fri, 12 Jul 2019 14:03:40 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 16:03:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 16:03:39 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 20/20] spi: stm32: Fix warnings when compiling with W=1
Thread-Index: AQHVKDUR3SR1eKcjwk2EeJ1cRCw6i6bHJKng
Date: Fri, 12 Jul 2019 14:03:39 +0000
Message-ID: <8309cbcd7ec54ccd9eaaba82d67e560a@SFHDAG6NODE3.st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
 <1561123618-2029-20-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1561123618-2029-20-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 20/20] spi: stm32: Fix warnings when
	compiling with W=1
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 21 juin 2019 15:27
> 
> This patch solves the following warnings:
> 
> drivers/spi/stm32_spi.c: In function 'stm32_spi_write_txfifo':
> drivers/spi/stm32_spi.c:116:20: warning: comparison between signed and
> unsigned integer expressions [-Wsign-compare]
>    if (priv->tx_len >= sizeof(u32) &&
>                     ^~
> drivers/spi/stm32_spi.c:122:27: warning: comparison between signed and
> unsigned integer expressions [-Wsign-compare]
>    } else if (priv->tx_len >= sizeof(u16) &&
>                            ^~
> drivers/spi/stm32_spi.c: In function 'stm32_spi_read_rxfifo':
> drivers/spi/stm32_spi.c:150:21: warning: comparison between signed and
> unsigned integer expressions [-Wsign-compare]
>        (priv->rx_len >= sizeof(u32) || (sr & SPI_SR_RXWNE))) {
>                      ^~
> drivers/spi/stm32_spi.c:156:21: warning: comparison between signed and
> unsigned integer expressions [-Wsign-compare]
>        (priv->rx_len >= sizeof(u16) ||
>                      ^~
> drivers/core/simple-bus.c:15:12: warning: no previous prototype for
> 'simple_bus_translate' [-Wmissing-prototypes]  fdt_addr_t
> simple_bus_translate(struct udevice *dev, fdt_addr_t addr)
>             ^~~~~~~~~~~~~~~~~~~~
> drivers/spi/stm32_spi.c: In function 'stm32_spi_set_speed':
> drivers/spi/stm32_spi.c:335:10: warning: comparison between signed and
> unsigned integer expressions [-Wsign-compare]
>       div > STM32_MBR_DIV_MAX)
>           ^
> drivers/spi/stm32_spi.c:344:19: warning: comparison of unsigned expression < 0
> is always false [-Wtype-limits]
>   if ((mbrdiv - 1) < 0)
>                    ^
> drivers/spi/stm32_spi.c: In function 'stm32_spi_probe':
> drivers/spi/stm32_spi.c:531:16: warning: comparison between signed and
> unsigned integer expressions [-Wsign-compare]
>   for (i = 0; i < ARRAY_SIZE(priv->cs_gpios); i++) {
>                 ^
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/spi/stm32_spi.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
