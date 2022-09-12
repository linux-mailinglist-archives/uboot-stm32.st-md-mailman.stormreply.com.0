Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B46C5B5690
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:47:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DC3BC03FD5;
	Mon, 12 Sep 2022 08:47:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB203C03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:47:51 +0000 (UTC)
Received: from [192.168.1.107] (82-131-156-25.pool.digikabel.hu
 [82.131.156.25])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 637FB8171B;
 Mon, 12 Sep 2022 10:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1662972471;
 bh=WvxJVF4AXtFuNx1DGk7L8vGJ2GYrJZ61gFCKU1NSg+Y=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=y1ZZnYGmAEBsoS1+q9fitbfRytx3FfwMaaqPEpdTJAROnzU1MDcuEJyQCsvdb/7V1
 lKGL4Dx7spNX+/FwbgqZmYCNknw25uhk90SgSDGeWMzBA2zjph7hapA4VrBnGavYsb
 P2toqrc9jpWJjT7SQzzWS+VV102lUJA39GbAatSuvsplNH9clEnaRCrZYYwlooAsfL
 olNU3HwtDkAx/9dodz0gv1j1ggNvMPNUI2hd9RyQ5kI672wSDKY30xZ4CobDqy+Br9
 b2+CU0KzvIm2SjYQcmDllU5AhBYqN6cJojdjafr+PH2n9Stf5Bmx9hETGk3AC7hhFf
 8ePrtIAYKTBvQ==
To: Alain Volmat <alain.volmat@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-3-alain.volmat@foss.st.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <88786e95-e4e7-bd97-1997-84ff71d66b9d@denx.de>
Date: Mon, 12 Sep 2022 10:48:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220912084201.1826979-3-alain.volmat@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io
Subject: Re: [Uboot-stm32] [PATCH v4 2/4] i2c: stm32: remove unused stop
 parameter in start & reload handling
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hello Alain,

On 12.09.22 10:41, Alain Volmat wrote:
> Functions stm32_i2c_message_start and stm32_i2c_handle_reload
> both get a stop boolean indicating if the transfer should end with
> a STOP or not.  However no specific handling is needed in those
> functions hence remove the parameter.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>  drivers/i2c/stm32f7_i2c.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
