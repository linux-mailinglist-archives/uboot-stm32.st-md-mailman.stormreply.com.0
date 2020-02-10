Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F73315843A
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 21:25:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42D37C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 20:25:31 +0000 (UTC)
Received: from avon.wwwdotorg.org (avon.wwwdotorg.org [104.237.132.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABB1BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 20:25:29 +0000 (UTC)
Received: from [10.20.204.51] (unknown [216.228.112.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by avon.wwwdotorg.org (Postfix) with ESMTPSA id CD1B01C08E6;
 Mon, 10 Feb 2020 13:25:27 -0700 (MST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.1 at avon.wwwdotorg.org
To: Patrick Delaunay <patrick.delaunay@st.com>
References: <20200210170129.8405-1-patrick.delaunay@st.com>
 <20200210170129.8405-6-patrick.delaunay@st.com>
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <4b5a447b-0d0f-2a34-033a-c34bdc89afcf@wwwdotorg.org>
Date: Mon, 10 Feb 2020 13:25:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200210170129.8405-6-patrick.delaunay@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [PATCH v2 7/7] test: env: add test for env info
	sub-command
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

On 2/10/20 10:01 AM, Patrick Delaunay wrote:
> Add a pytest for testing the env info sub-command:
> 
> test_env_info: test command with several option
> 
> test_env_info_test: test the result of the sub-commandi with quiet option,

Nit: Remove "i" from the end of "sub-commandi".

> diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py

> +@pytest.mark.boardspec('sandbox')

I assume that's just so things like "environment can't be persisted" can 
be guaranteed, since other boards will be different to sandbox here?

> +@pytest.mark.buildconfigspec('cmd_nvedit_info')
> +@pytest.mark.buildconfigspec('cmd_echo')
> +def test_env_info_test(state_test_env):
> +
> +    """Test 'env info' quiet command result with several options for test.
> +    """

Nit: It took me a while to realized what the "for test" and "_test" 
function name suffix meant. Perhaps _retcode might be a better function 
name suffix?

Acked-by: Stephen Warren <swarren@nvidia.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
