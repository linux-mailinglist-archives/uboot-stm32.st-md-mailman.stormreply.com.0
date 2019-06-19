Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 456C14B906
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 14:47:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00C78C5451D
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 12:47:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1401CC5451D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 12:47:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JCgCkQ012984; Wed, 19 Jun 2019 14:47:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=4PFGOiibJCnwMzhdq2bzN1S8QoQ4fOCi7lqS3lJD0FA=;
 b=tZPcF19PDshtuLivu93YXjIOUWbLPAzsPKbZIdSZian9U76yFs4t7Q/MD0i+YR0DBOr3
 +/2B1jdypI89nCRvIZvhFhNXO5yPKSf4M66PijXQNvf0dvisyI9FcIpYAIQCOEkvi4wy
 OKwjYGD21HCJKdyNjbGHhDMIkiFFcse8qTGQ3oILu3n+cTrZj/DlGS1KH4S4mtamrF5a
 ZcNE7RTr/c7PCl4XjRDfN4xJqu+G1k5Nu33Hfpth8NWOdw69E3HtaSUiVaIM30EoRIHR
 Q8L7X2qUHj2X2kMeamoDMO+edo1oFjB7ZQj3TOsWshc5JiAzESfSHNqSbGxw/Q3hQPWs cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813bwtk-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 14:47:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44F6E3D;
 Wed, 19 Jun 2019 12:47:09 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag7node1.st.com [10.75.127.19])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 118DF280D;
 Wed, 19 Jun 2019 12:47:09 +0000 (GMT)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG7NODE1.st.com
 (10.75.127.19) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Jun
 2019 14:47:08 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Wed, 19 Jun 2019 14:47:08 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic PALLARDY <loic.pallardy@st.com>
Thread-Topic: [PATCH v3 0/7] Add STM32 Cortex-M4 remoteproc driver
Thread-Index: AQHVF7JkijwusOcfd0mQ275ei+1Wgaai6UiA
Date: Wed, 19 Jun 2019 12:47:08 +0000
Message-ID: <170d0fa0-aab9-b92b-5b84-ef40364dcfb5@st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <E6AFBF401EBE8543903560BFB01B9E5A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_07:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 0/7] Add STM32 Cortex-M4 remoteproc
	driver
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


Are there any further comments?


BR

Fabien


On 31/05/2019 3:11 PM, Fabien Dessenne wrote:
> This patchset adds an STM32 remoteproc driver.
>
> Patch 1 adds the xxx_translate_dma_address() API which is the equivalent
> of the xxx_translate_address() relying on the "dma-ranges" property
> instead of the "ranges" property.
>
> Patch 2 fixes and completes function headers of remoteproc.h.
>
> Patch 3 & 4 add the support of the ELF image loading (the current
> implementation supports only binary image loading).
>
> Patch 5 is about the driver, and patches 6 & 7 are about MAINTAINERS
> and configs update.
>
> Changes since v2:
> -Moved helpers to rproc-elf-loader.c
> -Rename *elf* functions in *elf32*, preparing future support for elf64
> Changes since v1:
> -Added tests for rproc_elf*() and *_translate_dma_address()
> -Changed memory translation ops from da_to_pa() to device_to_virt() : the name
>   is updated and the translation now converts to virtual instead of physical.
> -Merged rproc_elf_is_valid() in rproc_elf_sanity_check()
> -Used explicit error values in rproc_elf_sanity_check()
> -Added and fix comments in various headers
> -Misc minor changes
>
> Fabien Dessenne (7):
>    dm: core: Introduce xxx_translate_dma_address()
>    remoteproc: fix function headers
>    remoteproc: add device_to_virt ops
>    remoteproc: add elf file load support
>    remoteproc: Introduce STM32 Cortex-M4 remoteproc driver
>    MAINTAINERS: Add stm32 remoteproc driver
>    configs: stm32mp15: enable stm32 remoteproc
>
>   MAINTAINERS                           |   1 +
>   arch/sandbox/dts/test.dts             |   4 +
>   common/fdt_support.c                  |   6 +
>   configs/stm32mp15_basic_defconfig     |   2 +
>   configs/stm32mp15_trusted_defconfig   |   2 +
>   drivers/core/of_addr.c                |   4 +
>   drivers/core/ofnode.c                 |   8 ++
>   drivers/core/read.c                   |   5 +
>   drivers/remoteproc/Kconfig            |  10 ++
>   drivers/remoteproc/Makefile           |   3 +-
>   drivers/remoteproc/rproc-elf-loader.c | 106 ++++++++++++++
>   drivers/remoteproc/sandbox_testproc.c |  19 +++
>   drivers/remoteproc/stm32_copro.c      | 257 ++++++++++++++++++++++++++++++++++
>   include/dm/of_addr.h                  |  18 +++
>   include/dm/ofnode.h                   |  16 ++-
>   include/dm/read.h                     |  20 ++-
>   include/fdt_support.h                 |  24 ++++
>   include/remoteproc.h                  | 146 +++++++++++++------
>   test/dm/remoteproc.c                  | 122 ++++++++++++++++
>   test/dm/test-fdt.c                    |  12 ++
>   20 files changed, 743 insertions(+), 42 deletions(-)
>   create mode 100644 drivers/remoteproc/rproc-elf-loader.c
>   create mode 100644 drivers/remoteproc/stm32_copro.c
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
