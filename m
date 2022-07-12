Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 188165715A3
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Jul 2022 11:24:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CBA1C640F7;
	Tue, 12 Jul 2022 09:24:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59A6FC03FD4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 09:24:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C7MORI023208;
 Tue, 12 Jul 2022 11:24:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=NEimgfniXp+RmJ0BG3XygpB0pzuUFlfxp8iYcuykYPo=;
 b=jiq/5M4FocBoKVU948+sNfxkYjBFK34XKhKdVj1e8STz+xwIfDwwm3BGw+a2ozS2sdMp
 ia04ODmVnH87UYAbeEYJGnGBEDC8+DC1gr3bekHe7uce7zxWgNXM8rYfSbNKldCVmA7C
 RE7iksB9kBHqL5fujEcxOMZBOglgzs/Kh3a++WMSmJB7BeAt2jON5qkRSwT4CCWHtnwt
 o8TlAngjDHSi9aA4kyNK9nlVymnVhdnPQnTH2yOaHyBbwmr+3dmu23lff86Ud7nN5XG4
 n8t9ovfQP39p61/0qpcY2nufTZWhTyxDtWpzq/QcIrdJCCvu1Owcpw5uqjVNAUDliLdh 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h94gu8rgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 11:24:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D34D10002A;
 Tue, 12 Jul 2022 11:24:12 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6507D215135;
 Tue, 12 Jul 2022 11:24:12 +0200 (CEST)
Received: from localhost (10.75.127.45) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 12 Jul
 2022 11:24:12 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>
Date: Tue, 12 Jul 2022 11:24:07 +0200
Message-ID: <165761774974.78107.9106866015167631531.b4-ty@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711194539.1.I96e7509b1edb4889e3d0d8a48e942556015ac705@changeid>
References: <20220711194539.1.I96e7509b1edb4889e3d0d8a48e942556015ac705@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_05,2022-07-08_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32m15: support
	STM32MP_BOARD_EXTRA_ENV for st boards
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

On Mon, 11 Jul 2022 19:45:50 +0200, Patrick Delaunay wrote:
> Correctly handle STM32MP_BOARD_EXTRA_ENV define in stm32mp15_st_common.h;
> the STM32MP_BOARD_EXTRA_ENV is added in CONFIG_EXTRA_ENV_SETTINGS
> definition, as it is done "stm32mp15_st_common.h"
> 
> Without this patch, the content of STM32MP_BOARD_EXTRA_ENV is not used in
> the default environment for STMicroelectronics boards.
> 
> [...]

Applied to stm32/master, thanks!

[1/1] configs: stm32m15: support STM32MP_BOARD_EXTRA_ENV for st boards
      commit: 6500c5760ccf8dffbb21cd74df8eabffb13d70dd

Best regards,
-- 
Patrick Delaunay <patrick.delaunay@foss.st.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
