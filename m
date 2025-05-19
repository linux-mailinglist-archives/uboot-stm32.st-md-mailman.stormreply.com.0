Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4355FABB830
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 May 2025 11:06:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05D41C78F9B;
	Mon, 19 May 2025 09:06:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9C03C78F8E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 May 2025 09:06:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6v9xX027406;
 Mon, 19 May 2025 11:06:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=x7tM5A+gEmQ+PJk3t5gWgi
 nXRoXvbODMMWnVNEEI8d4=; b=R3ZBfRopZyUIBcwtKjvoKK+xj/dnx6FPnqfHAI
 4W/xgl1pbf8JwYXVU7VT59ABaJOetta7MVnrHz9iE5vvPx0Xkbi7kClBTAuNcxaB
 nYbmWgbU6nYuFYkD21xtORg9DtjjrI2Vulw8e87ksotSMoBE3egcFilfxt7RdRaY
 9GYZnIf40J9ukwy1jhW9zKgjh9LWADnLPqsrXflSPZ6ZveVrpkYY5PwCVoYMRttO
 NfMrthhemjVdDpiidkruwg8pM+AcNPWsOmhup2gwqLGhGJjQMYH3m0+wrlEkwO2F
 Vu1ahEn2R7WwFf0wgcZjqHFgN8/JgyP+K7LqbBUDLw+APZdw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfk9x7d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 May 2025 11:06:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 44AF940045;
 Mon, 19 May 2025 11:05:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94B18A36ED4;
 Mon, 19 May 2025 11:04:23 +0200 (CEST)
Received: from localhost (10.48.86.182) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 11:04:23 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 19 May 2025 11:04:18 +0200
Message-ID: <20250519090421.470942-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, caleb.connolly@linaro.org,
 jerome.forissier@linaro.org, Casey Connolly <casey.connolly@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 ilias.apalodimas@linaro.org,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/3] Restore support of short name for type
	UUID parameter
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


Fix and add documentation/tests for selection by string for known
partition type GUID introduced by bcb41dcaefac ("uuid: add
selection by string for known partition type GUID"):

- split list_guid for short name (used also for partiton
  description with type parameter) and full name to display
  information

- as the function are uuid_str_to_bin() / uuid_guid_get_str()
  are no more under CONFIG_PARTITION_TYPE_GUID,  since commit
  31ce367cd100 ("lib/uuid.c: change prototype of uuid_guid_get_str()")
  and commit c1528f324c60 ("lib: compile uuid_guid_get_str if
  CONFIG_LIB_UUID=y") move the content of array under EFI_PARTITION
  and linker will remove it is not used it (in SPL)

- Add and fix documentation for gpt command

- Add test test_gpt_write_part_type to test "type=" parameters

This first patch solves an issue for the "system" shortcut for ESP,
removed by commit d54e1004b8b1 ("lib/uuid.c: use unique name
for PARTITION_SYSTEM_GUID") but used in 2 location (at least):

1- board/samsung/e850-96/e850-96.env:10:

partitions=name=esp,start=512K,size=128M,bootable,type=system;
partitions+=name=rootfs,size=-,bootable,type=linux

2- arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c:1151

			case PART_ESP:
				/* EFI System Partition */
				type_str = "system"
....
			offset += snprintf(buf + offset,
					   buflen - offset,
					   ",type=%s", type_str);



Patrick Delaunay (3):
  lib/uuid.c: restore support of system partition type for ESP
  doc: cmd: gpt: add information on type partition
  test/py: tests: gpt: add test_gpt_write_part_type

 doc/usage/cmd/gpt.rst     |  93 +++++++++++++++++++++---
 lib/uuid.c                | 148 +++++++++++++++++++-------------------
 test/py/tests/test_gpt.py |  27 +++++++
 3 files changed, 187 insertions(+), 81 deletions(-)

-- 
2.25.1

base-commit: 9dbe8d889546efd6c1a3470092588b9b6820158f
branch: sdsqsdsss
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
