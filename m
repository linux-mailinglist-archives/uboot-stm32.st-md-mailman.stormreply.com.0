Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0F3791930
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Sep 2023 15:56:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09298C6B454;
	Mon,  4 Sep 2023 13:56:10 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44039C6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 13:56:09 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7253E868D9;
 Mon,  4 Sep 2023 15:56:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1693835768;
 bh=eYb26EuOA2pUxnpaZ4C32tpRaYeZgeblEK4m/I3XpSU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ETvnDt71ajSd6cMNiSKz6DWGdppBBTcwaNNCnbX+nu4O7op+mZndBO1Tsvl9cPJgD
 rptSVH28WJooMSuMkr2Mn80+WnShfIgRXFuEDjIcwhwWZOHeLZkEJV98r38HUAOg9d
 Mk8ynzmVqEVoQxAW127EawB8af+xyn6petYqCmwqq7HIJAapC74wxDu5l49knSwL4u
 iRlsW+i9TwxVASiH64N73SaWgoD6/kyeLzNr69y2eJeEV9+7cUa6QBm5NhKVZe+fLi
 GJpavDpf8I65sZacaWEFAF1mg80T1hbGA59gegXcRb030cnmnbBSzMjKV1BAemIyCY
 6TRYjePE9T42A==
Message-ID: <a888c2fb-2d78-d623-3d42-75ff47b8950a@denx.de>
Date: Mon, 4 Sep 2023 15:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, u-boot@lists.denx.de
References: <20230904122021.2088429-1-fabrice.gasnier@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230904122021.2088429-1-fabrice.gasnier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Xavier Drudis Ferran <xdrudis@tinet.cat>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: host: ohci-generic: Make usage of
 clock/reset bulk() API
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

On 9/4/23 14:20, Fabrice Gasnier wrote:
> Make usage of clock and reset bulk API in order to simplify the code
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> 
> Changes in v2:
> - fix copy/paste on dev_err message since Marek's review comment
> - add Marek's review tag

Likely still needs RB from Xavier ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
