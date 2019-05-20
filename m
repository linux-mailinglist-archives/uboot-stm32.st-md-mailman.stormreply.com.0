Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A58236AD
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:01:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF5D7C0D2B9
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 13:01:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AE6EC0D2B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 13:01:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KCfdnn014518; Mon, 20 May 2019 15:00:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=hGKAhfYHERFklzs54xVYcTZfBDaBPFy/LwKq+fSIFVw=;
 b=BLq0OybTHIaAAnYNK3jSr4x08ZocehQArWJ/BcW78mWOtmPWp8Jdg5CP2hHQffKqS5XL
 OTn0RvEcVBpFB3Wk2pDd+O8WOA5YbnVTKtdwNkFB3T0iiO65SnanaN9oWxu4snRzBqS6
 KHysVhFnH3wrd3UBBnrN191k6Qh9y7uipMH+h/HG4JpR4qVgFPRJMPH6Sj6ALnCnGveV
 rq6EZ/6CFjRl8HJb4n2rxqVXm6Uf2yUYBajZfdXhIZyN9T+awcxmvLTCNKRZ3SEDsJ8L
 1jCwnUloqXTfX9FMRbbeyhuQ5OQbXXTlA32U9A8Y8IkqUnepnIj97UbGVxW8vsXu5Z/4 NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj773uvs6-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 15:00:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB69E31;
 Mon, 20 May 2019 13:00:11 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88C3B28E5;
 Mon, 20 May 2019 13:00:11 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May
 2019 15:00:11 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May 2019 15:00:11
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 May 2019 14:59:59 +0200
Message-ID: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_06:, , signatures=0
Cc: Tien Fong Chee <tien.fong.chee@intel.com>, Bin Meng <bmeng.cn@gmail.com>,
 Stephen Warren <swarren@nvidia.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Igor Opaniuk <igor.opaniuk@linaro.org>, Alexander Graf <agraf@suse.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Paul Burton <paul.burton@mips.com>,
 Mario Six <mario.six@gdsys.cc>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Anatolij Gustschin <agust@denx.de>, Chris Packham <judge.packham@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH v2 0/8] fdt: Allow indicating a node is for
	U-Boot proper only
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

I create this v2 serie with:

1/ documentation update for previous patch
   [U-Boot,v2] dm: remove pre reloc properties in SPL and TPL device tree
   http://patchwork.ozlabs.org/patch/1081155/

   PS: Code is already merged in commit commit c7a88dae997f ("dm: remove
       pre reloc properties in SPL and TPL device tree")
       but not the documentation.

2/ missing part for (patch 1/2)
   http://patchwork.ozlabs.org/project/uboot/list/?series=89846

3/ new tests for pre-reloc propertie in SPL as suggested by Simon
   (http://patchwork.ozlabs.org/patch/1081155/#2156621)

Tell me if is better to split the serie.

Regards
Patrick


Changes in v2:
- add sandbox_spl_dtb_defconfig for test
- solve issue for spl sandbox with dtb
- add new option for spl test: show embedded dtb
- add a new test option: device tree used for compilation
- move all spl test nodes in test dtb
- add some test for SPL with device tree
- rebase on master

Patrick Delaunay (8):
  sandbox: add config for SPL boot with devicetree
  fdt: Allow to use EMBEDDED device tree for SPL
  sandbox: add option show_of_embedded for spl test
  test: py: add option to select device tree used during compilation
  test: move SPL test nodes in test device tree
  test: check u-boot properties in SPL device tree
  fdt: Allow indicating a node is for U-Boot proper only
  dm: doc: add documentation for pre-reloc properties in SPL and TPL

 arch/sandbox/cpu/spl.c            | 188 +++++++++++++++++++++++++++++++++++
 arch/sandbox/cpu/start.c          |   9 ++
 arch/sandbox/dts/sandbox.dts      |  36 -------
 arch/sandbox/dts/sandbox64.dts    |  36 -------
 arch/sandbox/dts/test.dts         |  54 +++++++++++
 arch/sandbox/include/asm/state.h  |   1 +
 board/sandbox/MAINTAINERS         |   1 +
 configs/sandbox_spl_dtb_defconfig | 199 ++++++++++++++++++++++++++++++++++++++
 doc/README.SPL                    |  16 +++
 doc/README.TPL                    |   4 +
 doc/driver-model/README.txt       |   4 +
 drivers/core/util.c               |   2 +
 drivers/video/video-uclass.c      |   4 +-
 include/dm/ofnode.h               |   6 +-
 include/dm/util.h                 |   6 +-
 lib/fdtdec.c                      |   6 ++
 test/py/conftest.py               |  12 ++-
 test/py/tests/test_ofplatdata.py  |  53 ++++++++++
 test/run                          |   8 +-
 19 files changed, 566 insertions(+), 79 deletions(-)
 create mode 100644 configs/sandbox_spl_dtb_defconfig

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
