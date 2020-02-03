Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 228561502C7
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Feb 2020 09:46:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 952F5C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Feb 2020 08:46:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B768BC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 08:46:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0138gntF026769
 for <uboot-stm32@st-md-mailman.stormreply.com>; Mon, 3 Feb 2020 09:46:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BiWoFtUYINRkU57pdZc6iqdfed2zpbjab4ORUnobsXE=;
 b=N2YDZYmlsNQ8+AFbDnWn7CIgEZR3SzuRsohLcjSFg/rQZkVg6wCeIk64b37hU4OYgqYV
 Uvuwo6tw6vnJXb/y+j9c9xXdXVrg9IUGFoX96yNdrMU7636s76AT6jF61npQhhz8ZlRh
 HQ6ipLV3rpduERf/RzmFTP2PZkY0j/gYgRKzBM4wFO6Dy9z8fq78+ZOjbzrfWjWob1+q
 HY9JLclMELmfdn5zDh1lDnt4yPlfN4XImlVUvvVpe8a3MHS2e+BaXDnqtsRm0WJ4YsvC
 kwOte9QqeviZlubGz0G5dR8dtFk23G8/t2vhFy1ejJwzmbBBZyV6KH+3SFumkKgvBS/K Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xvyp5r8m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Mon, 03 Feb 2020 09:46:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAC2A100034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 09:46:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D05E82AD12E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 09:46:13 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 3 Feb
 2020 09:46:13 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 3 Feb 2020 09:46:13 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, Loic PALLARDY <loic.pallardy@st.com>, "Benjamin
 GAIGNARD" <benjamin.gaignard@st.com>,
 Gerald BAEZA <gerald.baeza@st.com>, Kamel KHOLTI <kamel.kholti@st.com>
Thread-Topic: [U-BOOT INTERNAL REVIEW][PATCH 0/3] stm32 and sti board: remove
 dt_high and initrd_high 
Thread-Index: AQHV2ERVSu1r/9vj/kS7/AgfBXZizKgJLDBA
Date: Mon, 3 Feb 2020 08:46:13 +0000
Message-ID: <4c68359dec1a48ea82d8ac6b15a80bc0@SFHDAG6NODE3.st.com>
References: <20200131144004.3396-1-patrice.chotard@st.com>
In-Reply-To: <20200131144004.3396-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_02:2020-02-02,
 2020-02-03 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [U-BOOT INTERNAL REVIEW][PATCH 0/3] stm32 and sti
 board: remove dt_high and initrd_high
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

Ok pour la serie

> -----Original Message-----
> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 31 janvier 2020 15:40
> To: Patrice CHOTARD <patrice.chotard@st.com>; Alexandre TORGUE
> <alexandre.torgue@st.com>; Loic PALLARDY <loic.pallardy@st.com>; Benjamin
> GAIGNARD <benjamin.gaignard@st.com>; Gerald BAEZA
> <gerald.baeza@st.com>; Kamel KHOLTI <kamel.kholti@st.com>
> Cc: Patrick DELAUNAY <patrick.delaunay@st.com>; U-Boot STM32 <uboot-
> stm32@st-md-mailman.stormreply.com>
> Subject: [U-BOOT INTERNAL REVIEW][PATCH 0/3] stm32 and sti board: remove
> dt_high and initrd_high
> Importance: High
> 
> From: Patrice Chotard <patrice.chotard@st.com>
> 
> For stm32 f4, f7, h7 and STi boards, remove fdt_high and initrd_high as they
> shouldn't be used, this allows the fdt and initrd relocation.
> This implies to set CONFIG_SYS_BOOTMAPSZ to indicate the amount of
> memory available to contain kernel, device tree and initrd for relocation.
> 
> Patrice Chotard (3):
>   board: stih410-b2260: remove fdt_high and initrd_high
>   board: stm32: fix extra env setings addresses
>   board: stm32: remove fdt_high and initrd_high
> 
>  include/configs/stih410-b2260.h        |  8 ++++++--
>  include/configs/stm32f429-evaluation.h | 15 +++++++++------
> include/configs/stm32f469-discovery.h  | 15 +++++++++------
>  include/configs/stm32f746-disco.h      | 15 +++++++++------
>  include/configs/stm32h743-disco.h      | 14 ++++++++------
>  include/configs/stm32h743-eval.h       | 14 ++++++++------
>  6 files changed, 49 insertions(+), 32 deletions(-)
> 
> --
> 2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
