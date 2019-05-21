Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C42567D
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 19:19:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B820C7C7D8
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 17:19:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39FDCC35E16
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 17:19:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4LHDLxE025217; Tue, 21 May 2019 19:19:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=1m0jpBpLZj+G/CzCZFdk03k6zKZn6b+vBi/dHKnMeLs=;
 b=uaTEWcdf71DFk8w/I7XCMUQunyjPImHPovSKcmdKwIjhNsdy9Kb8Uht742hBxvuMYEKd
 pB3QI27j16j9FJGuGR+mr5Id9pmCqifN9MAWw5AIxjGrZ13Mo5SHgvVYYmb+p78l9t4X
 p0ifKdosOqfYVIHydG+X48sF/IG0vcfuAmMnr+DGAsPH28iYckr1R5uebzrxTAvaphyu
 SkBR4UqbQzuk0luYQQRh7hbm7XvMRSIQ85gCJB/rrLjmEgaXh9tnUw1wJ3+G2Hd0Mp12
 8KEog8tlCKxHOdlzwJccjx9lF5XO0NL1U7TLm2XtrkeRkcIENLC3Vn48U4b+fOEjnRYq CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7h0u31n-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 19:19:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F380531;
 Tue, 21 May 2019 17:19:27 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8AFA4F13;
 Tue, 21 May 2019 17:19:27 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May
 2019 19:19:27 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May 2019 19:19:25
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 May 2019 19:19:10 +0200
Message-ID: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_04:, , signatures=0
Cc: Tien Fong Chee <tien.fong.chee@intel.com>,
 Anatolij Gustschin <agust@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Simon
 Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Bin Meng <bmeng.cn@gmail.com>,
 Chris Packham <judge.packham@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH v3 0/3] fdt: Allow indicating a node is for
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

I create this serie with:

1/ documentation update for previous patch
   [U-Boot,v2] dm: remove pre reloc properties in SPL and TPL device tree
   http://patchwork.ozlabs.org/patch/1081155/

   PS: Code is already merged in commit commit c7a88dae997f ("dm: remove
       pre reloc properties in SPL and TPL device tree")
       but not the documentation.

2/ missing part for v1 serie (patch 1/2)
   http://patchwork.ozlabs.org/project/uboot/list/?series=89846
   => http://patchwork.ozlabs.org/patch/1035797

3/ new tests for pre-reloc propertie in SPL as suggested by Simon
   (http://patchwork.ozlabs.org/patch/1081155/#2156621)

Regards
Patrick


Changes in v3:
- simplify test after Simon remarks by using fdtgrep on spl dtb
- rebase on u-boot-dm/sandbox-working

Changes in v2:
- rebase on master

Patrick Delaunay (3):
  test: check u-boot properties in SPL device tree
  fdt: Allow indicating a node is for U-Boot proper only
  dm: doc: add documentation for pre-reloc properties in SPL and TPL

 arch/sandbox/dts/sandbox.dtsi    | 18 ++++++++++++++++++
 doc/README.SPL                   | 16 ++++++++++++++++
 doc/README.TPL                   |  4 ++++
 doc/driver-model/README.txt      |  4 ++++
 drivers/core/util.c              |  2 ++
 drivers/video/video-uclass.c     |  4 +++-
 include/dm/ofnode.h              |  6 ++++--
 include/dm/util.h                |  6 ++++--
 test/py/tests/test_ofplatdata.py | 28 ++++++++++++++++++++++++++++
 9 files changed, 83 insertions(+), 5 deletions(-)

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
