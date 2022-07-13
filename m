Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB20573508
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jul 2022 13:13:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54C10C640FC;
	Wed, 13 Jul 2022 11:13:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2E1EC640ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 11:13:13 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DArfnW027660;
 Wed, 13 Jul 2022 13:13:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=gNSutGpaTEnBWBMParZzGctrtkefAPlh/2g6bXjdG+U=;
 b=qndH1JVanS8ndwSADE2CpLI+O4CWjP+q+o39NPjpVgU74jPm/sSODeG2KN6tsWJzU2rQ
 2JV15DDIAmQ4vlsPvf3w1X1x1K3wnTZL7b6PcDXYh/hV89xmRpgVfsjfJiUuTIhxQKeh
 gWBpnDoY3X6L/ZW68inM09sqQsRnUiZitb8r0xfGIdjp/O7tE6r3hKe3z5ze3gkzB51o
 +xEdAl8Gm2NiYqTupFMQ+b9nczCplDP4GgulytpWBzA1Lhiyko5vHp8fQiU1eyZRomin
 akuaJrqCsa1VK7xugzojrc3JlZxirSckFs8BcUZAJBWAoXSdtYP9+pu8VUG6lrDgSZlu eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h93cwgxhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:13:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BAED910002A;
 Wed, 13 Jul 2022 13:13:06 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6D9421B52C;
 Wed, 13 Jul 2022 13:13:06 +0200 (CEST)
Received: from localhost (10.75.127.47) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Jul
 2022 13:13:06 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>
Date: Wed, 13 Jul 2022 13:12:54 +0200
Message-ID: <165771069386.1352308.16387774270255205934.b4-ty@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630100144.v2.1.Idba00f2816d362a1675c8c74eac80400cb2e4de7@changeid>
References: <20220630100144.v2.1.Idba00f2816d362a1675c8c74eac80400cb2e4de7@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-13_02,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] mmc: stm32_sdmmc2: cosmetic:
	rename stm32_sdmmc_bind
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

On Thu, 30 Jun 2022 10:01:45 +0200, Patrick Delaunay wrote:
> Rename stm32_sdmmc_bind to stm32_sdmmc2_bind as all other functions
> in SDMMCv2 driver
> 
> series-changes: 2
> - fix typo in commit message (/oter function/other functions/)
> 
> 
> [...]

Applied to stm32/master, thanks!

[1/3] mmc: stm32_sdmmc2: cosmetic: rename stm32_sdmmc_bind
      commit: 5f1e6b639b47eea5177b1128c384da76dce2dbe6
[2/3] mmc: stm32_sdmmc2: remove privdata
      commit: efd77dbca304d6cceb40675365485d84cce40ccd
[3/3] mmc: stm32_sdmmc2: introduce of_to_plat ops
      commit: cb8edb996bf20be09b88b2b17520beec433067cd

Best regards,
-- 
Patrick Delaunay <patrick.delaunay@foss.st.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
