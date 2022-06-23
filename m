Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B196E558864
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Jun 2022 21:12:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6614FC5E2CC;
	Thu, 23 Jun 2022 19:12:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D65EDC0D2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jun 2022 19:11:59 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 062A2840B6;
 Thu, 23 Jun 2022 21:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656011519;
 bh=hRxMIZ2oeavQbJKlpDp1ILmWUjEcoBWuwwA4N/KfqDE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CKwnWP8WAkA7dDqM0KlObxhmzevwbmpf9v3gW8t/nMVbYYi0wioXMRInx7ewmxtav
 oVx7O+u/+qIZd6tsmSGOKBYq9fYKbCV9jYynTALI8lgtV8n/T280EJCV0W2vNNTtEu
 cJsGeguZXxji8Qw0JPPwW1ztgXkvNxTPNzLCGEcCbbyW3JEiXA8gphd9+UO+Vbo7ZY
 jxBNYq6pG9Zj5ibxIXKCghX4tpggHamrE9KGY9Qi4D8ERZJ5+VVZ+8vLA/lVUFiUz5
 tfESZzqC1jId4j/zizk6Pf6wzgLCug2lzjUctCjeJJpHo/lXFwKqRkAIx9bV886Cxr
 DYaDys5f4I2bQ==
Message-ID: <18f6e7a7-afa3-06d8-3596-f5c00f506448@denx.de>
Date: Thu, 23 Jun 2022 20:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220620181341.1.Idba00f2816d362a1675c8c74eac80400cb2e4de7@changeid>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220620181341.1.Idba00f2816d362a1675c8c74eac80400cb2e4de7@changeid>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Peng Fan <peng.fan@nxp.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 1/3] mmc: stm32_sdmmc2: cosmetic: rename
	stm32_sdmmc_bind
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 6/20/22 18:13, Patrick Delaunay wrote:
> Rename stm32_sdmmc_bind to stm32_sdmmc2_bind as all oter function

s@oter@other@ typo
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
