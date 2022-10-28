Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4772A610CA0
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Oct 2022 11:01:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 010CCC63324;
	Fri, 28 Oct 2022 09:01:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E327C04003
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 09:01:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29S886mV008626;
 Fri, 28 Oct 2022 11:01:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=uQZXYAPwTS7FG6o+ZcNUSZg8CFac9mMv7SbCYCuZS0U=;
 b=ID7VuEeaKJZ3FWWOc0lP0ARF4HdrGW5bpVWUuhhz0T8Sgn+X0Dlu/x3NXjs7ohblK0PR
 lvaWJNPtU/cH6No351/ILqLTSQoMjrbPwiCHVuxiJCK+pAGtO88gIjWwEPdSwkZ75Q1q
 LYUxwjoPwuIGyREMhvpvCP+Gk6JeJt76TgCraGxA2lFoVXMlvEmfQre9K5kfE6OJFUgR
 VbobJJkcWZ/mLdQr9Z4QhwDTv4XgXhaXe3BPVeJ2VwYr7tdztmYO2mfobdNhZPgDv/T0
 c7bK7yOi+/ScEhDXkORfMKZt38UUIg+xMnAlxGSYXuT8PcD6qVwhwHQObUYHzvq1cxxq kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kfagcbj3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 11:01:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F7DF10002A;
 Fri, 28 Oct 2022 11:01:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29524215133;
 Fri, 28 Oct 2022 11:01:31 +0200 (CEST)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 11:01:30 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Oct 2022 11:01:17 +0200
Message-ID: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_04,2022-10-27_01,2022-06-22_01
Cc: Edoardo Tomelleri <e.tomell@gmail.com>, Peter Hoyes <Peter.Hoyes@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Zhang Ning <zhangn1985@qq.com>, Zhaofeng Li <hello@zhaofeng.li>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 0/3] cmd: pxe: support INITRD and FDT
	selection with FIT
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


Since the commit d5ba6188dfbf ("cmd: pxe_utils: Check fdtcontroladdr
in label_boot") the FDT or the FDTDIR label is required in extlinux.conf
and the fallback done by bootm command when only the device tree is present
in this command parameters is no more performed when FIT is used for
kernel.

The next file "extlinux.conf" no more selects the device tree in FIT
but use the pxe fallback with the device tree of U-Boot.

menu title Select the boot mode
DEFAULT test
LABEL test
        KERNEL /fitImage

This serie restores the possibility to use a FIT in extlinux.conf
by using FDT label with the same string.

menu title Select the boot mode
DEFAULT test
LABEL test
        KERNEL /fitImage
        FDT /fitImage

even when a specific FIT config is used:

menu title Select the boot mode
DEFAULT test
LABEL test
        KERNEL /fitImage#config
        FDT /fitImage#config

The last commit of the series is only a minor improvement.



Patrick Delaunay (3):
  cmd: pxe: reorder kernel treatment in label_boot
  cmd: pxe: support INITRD and FDT selection with FIT
  cmd: pxe: use strdup to copy config

 boot/pxe_utils.c    | 69 +++++++++++++++++++++++++--------------------
 doc/README.pxe      |  8 ++++++
 include/pxe_utils.h |  2 ++
 3 files changed, 49 insertions(+), 30 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
