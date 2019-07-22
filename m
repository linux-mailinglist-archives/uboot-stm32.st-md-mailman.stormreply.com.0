Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A15FD6FF9B
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 14:28:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 507BDCD21C8
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 12:28:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60537CD21C7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 12:28:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MCQKu7014144; Mon, 22 Jul 2019 14:27:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=g4xuwFQsjx9WVQi9i1D7k78xmXuIoszAEjfppIUgOaE=;
 b=qy+oTsWnHacDF5rIMMy4DbzcNAZScIvDx+SMhU9Z7MC0evEMWyPU+uEPeNc6705pNg00
 Y1y5ML1D4S5Szbnxf7LJjiT5hJF2JC5igrAxB2FuQwlt9TcmhsZ/3Ol8dIrvgoVxTsc5
 HswmiOZAtqACBzJfQA7piqk5tfJYZQjpND1TGxK3OQVXW7tthQ8p1B2ADtACtQz0znME
 xNcI9teT2/MBHD9kq+KyEa7HbZ4s0vSpup4KP7YJ7BMZ19l1co40TW19KzvlpQWWFGWh
 AnorXEP5skiKFYbJvIUNAIyPAWCkr4ErPIBWuXA0oU5boYw0owk4nMt2qf1x58VA3Ima 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tur39bqnw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 14:27:59 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C6CEC3D;
 Mon, 22 Jul 2019 12:27:48 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACAD82CE0;
 Mon, 22 Jul 2019 12:27:48 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 14:27:48 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 22 Jul 2019 14:27:48 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>, 
 Christophe KERELLO <christophe.kerello@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>, Lokesh Vutla <lokeshvutla@ti.com>, "Andreas
 Dannenberg" <dannenberg@ti.com>, Loic PALLARDY <loic.pallardy@st.com>
Thread-Topic: [PATCH v3 1/7] dm: core: Introduce xxx_translate_dma_address()
Thread-Index: AQHVF7JlqFWT1C4D7Uea2QZDLzkWSqbW4hNA
Date: Mon, 22 Jul 2019 12:27:47 +0000
Message-ID: <268742eefcb447d2bf316674861e74ca@SFHDAG6NODE3.st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
 <1559308296-17027-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1559308296-17027-2-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_09:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/7] dm: core: Introduce
	xxx_translate_dma_address()
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

> From: Fabien DESSENNE <fabien.dessenne@st.com>
> Sent: vendredi 31 mai 2019 15:12
> 
> Add the following functions to translate DMA address to CPU address:
> - dev_translate_dma_address()
> - ofnode_translate_dma_address()
> - of_translate_dma_address()
> - fdt_translate_dma_address()
> These functions work the same way as xxx_translate_address(), with the
> difference that the translation relies on the "dma-ranges" property instead of the
> "ranges" property.
> 
> Add related test. Test report:
> => ut dm fdt_translation
> Test: dm_test_fdt_translation: test-fdt.c
> Test: dm_test_fdt_translation: test-fdt.c (flat tree)
> Failures: 0
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  arch/sandbox/dts/test.dts |  4 ++++
>  common/fdt_support.c      |  6 ++++++
>  drivers/core/of_addr.c    |  4 ++++
>  drivers/core/ofnode.c     |  8 ++++++++
>  drivers/core/read.c       |  5 +++++
>  include/dm/of_addr.h      | 18 ++++++++++++++++++
>  include/dm/ofnode.h       | 16 +++++++++++++++-
>  include/dm/read.h         | 20 +++++++++++++++++++-
>  include/fdt_support.h     | 24 ++++++++++++++++++++++++
>  test/dm/test-fdt.c        | 12 ++++++++++++
>  10 files changed, 115 insertions(+), 2 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
