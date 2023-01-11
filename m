Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 034CB6659A0
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Jan 2023 12:04:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D863C65048;
	Wed, 11 Jan 2023 11:04:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C15F8C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jan 2023 11:04:35 +0000 (UTC)
Received: from [192.168.1.107] (fibhost-66-247-38.fibernet.hu [85.66.247.38])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7B403853EC;
 Wed, 11 Jan 2023 12:04:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1673435075;
 bh=GxSNNH2Dkf0uEEXzjGDSr2r4aFarw1V8tlFGksFJKtY=;
 h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
 b=XmTK+ZfHCV54/dN1A4sTQqZuZheHMyfDUFc2JO6aIv3mNUDhpuQ+rru2I4vM5EuRZ
 jsaf072lWA7tDyPgiy3D1xmgoLGfSOMABqUgbGSu0RbMLAAu4W7zacydFXJoV/NUtq
 7dolDpIFAoBV6SXoQ5U91ApjhS8g5mXeiGwhL+aLkDh5MmaRgKi50KdTpYjIwEgSub
 OoHMiKKrdo3rNsUaQSpNnN6ty4VYKEtskdUFHcvnzUnedoZml90h6wJIN93U1WUiR7
 MldumqDE6aQ5zBbSztSPTC0zx1DurYd4379RDtUQ3VzNGsha3BH7bp7qfv+u5omlyc
 MzgoWBbee+aDw==
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
 <20221214165126.2.I10631f84f71a23c2c3c6ede7299743000ce82ccd@changeid>
From: Heiko Schocher <hs@denx.de>
Message-ID: <fd36d7dc-1d4a-af81-e314-0e22912deb94@denx.de>
Date: Wed, 11 Jan 2023 12:04:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20221214165126.2.I10631f84f71a23c2c3c6ede7299743000ce82ccd@changeid>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] env: add failing trace in env_erase
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

Hello Patrick,

On 14.12.22 16:51, Patrick Delaunay wrote:
> Add trace in env save to indicate any errors to end user and avoid
> silent output when the command 'env erase' is not executed as it is
> done in env_save with commit 8968288cb477 ("env: add failing trace in
> env_save")
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  env/env.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
