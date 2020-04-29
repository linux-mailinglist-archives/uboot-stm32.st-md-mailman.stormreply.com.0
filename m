Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E31BE5CD
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 20:04:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DD49C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 18:04:44 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEAD8C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 18:04:41 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id i13so2633349oie.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 11:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YAtSn7mV59DRZzJSaw5NbUhhxCdnAnPRr0Eb1P1e1HI=;
 b=h9CxBUPBGHlJ9/5Qt+xRxCVN6PWlrhFPnggRq4NEfW1wLe0vEoDWWa7vcnx2Zj9jm+
 s9BQeuUP+Zt5f5A/+Kedp/hWpSMx+3/p1Hz2vd5JQFixwxpXjKElBcv9lgS27v+wHNBo
 TzjJbr1lx7JnXWhHIHVSWz634eMmw75jbVLNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YAtSn7mV59DRZzJSaw5NbUhhxCdnAnPRr0Eb1P1e1HI=;
 b=U2EScFtbnyONLPyZVzHvTFCenY6v4E6w9FOPYZApNan3hFp96Sbl7ANBIO7lEhL6XO
 ZAxZN0alKqW61QMA93lSmBTE5WYNzTMCRB+8ACjdmniJGSjuCCxg4CTXu5D7DN31MRcj
 v22i+ZYvwOGvI0cCwiXfFUG6hGreKOFaQGurNDZGgW9xLvzecvyYrl1rQVEkJfaOJI4O
 99MZe0R4JSFFFbPOg8OwbTApNBLqOIXvvnEevjtTRlNXPZmcrcwceFU6a7MGSfAv86l7
 +b5nPtvTmluxaT6TYHulfCyu3Joh7UGlK5oFz7jFXcoV1mMtlMnwXRMRxdxWg0vibhUr
 sPig==
X-Gm-Message-State: AGi0PubsABA29JWXWAicddo3sEK/NnhMdP3/7FbEp20BvG/Kbbe/275u
 G5vZRnV2NtmirFNVA9FMHiaqWbGazr7N9GhHgK6sag==
X-Google-Smtp-Source: APiQypJHz1pz6WYCidnzbAnNQcKBfrPWl92IR6VBD3GOHEFenCRwpg6XJNrd2DPAzHUN/UiqE/5nSEM+14AyWgx8fqo=
X-Received: by 2002:aca:bb83:: with SMTP id l125mr2496423oif.122.1588183478578; 
 Wed, 29 Apr 2020 11:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200429122031.31279-1-patrice.chotard@st.com>
 <20200429122031.31279-5-patrice.chotard@st.com>
In-Reply-To: <20200429122031.31279-5-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Apr 2020 12:04:14 -0600
Message-ID: <CAPnjgZ3Gyhtx-m=piYrbfiWRa+aLW7RUuynPcqkG+O08RNY8_w@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/5] test/py: Update test_bind
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

On Wed, 29 Apr 2020 at 06:20, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> As bind-test is now binded at sandbox startup and no more by
> test_bind.py, bind-test nodes are not located at the end of
> "dm tree" output, but can be located everywwhere in the tree, so

everywhere

> bind-test output could either be:
>
>  simple_bus    0  [   ]   generic_simple_bus    |-- bind-test
>  phy           0  [   ]   phy_sandbox           |   |-- bind-test-child1
>  simple_bus    1  [   ]   generic_simple_bus    |   `-- bind-test-child2
>
> or:
>
>  simple_bus    5  [   ]   generic_simple_bus    `-- bind-test
>  phy           2  [   ]   phy_sandbox               |-- bind-test-child1
>  simple_bus    6  [   ]   generic_simple_bus        `-- bind-test-child2
>
> in_tree() function need to be updated to take care of that change.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> Changes in v2: None
>
>  test/py/tests/test_bind.py | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
