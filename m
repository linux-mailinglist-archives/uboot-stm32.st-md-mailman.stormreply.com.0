Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC5A57E3E8
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Jul 2022 17:46:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11297C03FCB;
	Fri, 22 Jul 2022 15:46:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 641E9C035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 15:46:43 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1BE6182142;
 Fri, 22 Jul 2022 17:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658504802;
 bh=A4W1TK7xOBxTaIe+JN66/mhIV6wMiVraT0tvFVcshtg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GdE6KwwG5HA0zvpPM/Gvkj2eeCfb+p1WgeKDbj2nXEH76OFzkx2SKksuVQbTcO/r9
 0d3eVPWayOizRyZbKoMPwimvsmxi2i5SPpcjEDRLVrbxkspWiaduxtKD7S60fK1x7q
 JnQRp6Rnk5rfsRTNa0SYsF5u+xZHHB6FP6fmCr21RPIgDblr0T6G7i+2W09bLSxBef
 EpQbTdu2oOnOpZx6EgsdJ/gOPfJNbOZcm70Sxgy3H6er8COSxESHCZG26P9/1VPxRd
 ifIb7kpCtwPoFtPljAmSakOEZGIWKXrsQ35KzBH2YnO/N534HdvrV5dokdchfMqjC1
 YJRSlm9VcfVLw==
Message-ID: <783be8bb-f323-6299-9fe4-b55ef7d48888@denx.de>
Date: Fri, 22 Jul 2022 17:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Philip Oberfichtner <pro@denx.de>, u-boot@lists.denx.de
References: <20220722082703.4090825-1-pro@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220722082703.4090825-1-pro@denx.de>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Tom Rini <trini@konsulko.com>, peng.fan@nxp.com, festevam@denx.de,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>, sbabic@denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 0/4] Deduplicate dhelectronics board
	files
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

On 7/22/22 10:26, Philip Oberfichtner wrote:
> 
> This series unifies common MAC address code for imx6, imx8 and stm32
> based boards by DH. It is thought of as a starting point for more
> deduplication in the future.

Entire series

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
