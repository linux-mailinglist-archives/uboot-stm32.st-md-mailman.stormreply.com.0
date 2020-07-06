Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98831216112
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 23:54:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 665D1C36B29
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 21:54:35 +0000 (UTC)
Received: from avon.wwwdotorg.org (avon.wwwdotorg.org [104.237.132.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C1C8C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2020 21:54:33 +0000 (UTC)
Received: from [10.2.50.160] (searspoint.nvidia.com [216.228.112.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by avon.wwwdotorg.org (Postfix) with ESMTPSA id 2DD8A1C0590;
 Mon,  6 Jul 2020 15:54:30 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.3 at avon.wwwdotorg.org
To: Patrick Delaunay <patrick.delaunay@st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
 <20200625075958.9868-15-patrick.delaunay@st.com>
From: Stephen Warren <swarren@wwwdotorg.org>
Autocrypt: addr=swarren@wwwdotorg.org; prefer-encrypt=mutual; keydata=
 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 YdVt
Message-ID: <169ea36f-cca9-24b6-9aab-10b70f36333e@wwwdotorg.org>
Date: Mon, 6 Jul 2020 15:54:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200625075958.9868-15-patrick.delaunay@st.com>
Content-Language: en-GB
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>, Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [PATCH v3 14/14] test: sandbox: add test for
	erase command
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

On 6/25/20 1:59 AM, Patrick Delaunay wrote:
> Add test for the erase command tested on ENV in EXT4.

Acked-by: Stephen Warren <swarren@nvidia.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
