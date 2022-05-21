Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEBC52F759
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 May 2022 03:33:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40CCFC56630;
	Sat, 21 May 2022 01:33:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B505FC03FEB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 May 2022 01:33:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E37FB8334E;
 Sat, 21 May 2022 03:33:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653096811;
 bh=byaFN939JWJM9FbppPm2bKf35pIA4SwY2W/OM60601Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iOjmePXwJmrFwFq+1YMVciO48WQGchGcrJP8dl8/dn/GQA0cyw9IHMWS1ka9wOwFQ
 4mGV+7OViPzUykWzNa6f7QdFOiJqwvrK4SD2Vb+B7mh6nbRt8NEQF12PPJI/hy4mNb
 GsIYT7W3qIGdbqghWjRtTGTBVQw4H8m4BoozASqeY8nwgYezMu88ULxswU/Gvj/ELM
 9+qzjoReUcJ9aCQwgYE/+vwBG0PegQwnIuHzDL7U7m1iS0vPSvfa26btPc1LIvGLpH
 UeXDuFE0b5tF5syy9sAAEpMAhh5xJiyQ/WzACVXYAppUL/nXG85PBl8GxcRVysr6vQ
 Bu0NxFiKZGs5A==
Message-ID: <ea75b7dd-05bc-999a-e827-39c23d046809@denx.de>
Date: Sat, 21 May 2022 03:33:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220519184552.RFC.1.I4f6455f026820524103f7fbdffaafd3b75585197@changeid>
 <20220519184552.RFC.2.Ida901b98d25a7f60b6fb05d18f2e030d9c9ecc5c@changeid>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220519184552.RFC.2.Ida901b98d25a7f60b6fb05d18f2e030d9c9ecc5c@changeid>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [RFC PATCH 2/2] ARM: stm32: activate OF_LIVE for
	DHSOM
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

On 5/19/22 18:46, Patrick Delaunay wrote:
> Activate the live DT with CONFIG_OF_LIVE to reduce the DT parsing
> time.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Tested-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
