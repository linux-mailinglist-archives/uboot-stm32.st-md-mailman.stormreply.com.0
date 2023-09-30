Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9A57B43F8
	for <lists+uboot-stm32@lfdr.de>; Sat, 30 Sep 2023 23:52:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52C34C6B479;
	Sat, 30 Sep 2023 21:52:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16C9DC6B477
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 21:52:33 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 327A687079;
 Sat, 30 Sep 2023 23:52:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1696110753;
 bh=CeyuBykVpPlE2DGzvoKuWNsn5SPe/PLD2jCTNNaRy5c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=medq66POngseMDDI6JGdXL0en7OHTHoNI0A30rN2atnxyZ93EhnlYYGxdX6J+44mx
 1ncUN1gqtyNeZ7TulzjMUdXGLMfcSMFZ8pdF02CGEcnpXRBviDoVM/qIRWKRtpldDI
 SPdPVF6uCWrc3mANwS9aOQeX67XLlvvEjjVaQn9CJmX/ELJNItm1L2w11Ge5pDLdEo
 +QSEwb/tIGnAKlazhUBRc5qJWbgjRYgO0A71KmtTqItv+OYDs8B1kAMRwbE/1X0Lt9
 i/jXK2VnzpBcVBhGBFWvC3zCHTzCSJq2CpqJPTKrYd4MbdgHEsrf2vJZkjn9PqW/hF
 oTbcpr3oFbL3Q==
Message-ID: <7943bfcb-204d-526d-9208-fd38fbc567b4@denx.de>
Date: Sat, 30 Sep 2023 23:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Harald Seiler <hws@denx.de>, u-boot@lists.denx.de
References: <20230927124625.247858-1-hws@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230927124625.247858-1-hws@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: dh_stm32mp1: Only print board
 code with CONFIG_SPL_DISPLAY_PRINT
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

On 9/27/23 14:46, Harald Seiler wrote:
> Ensure that the SoM and board code information is only printed when
> CONFIG_SPL_DISPLAY_PRINT is set.
> 
> Signed-off-by: Harald Seiler <hws@denx.de>

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
