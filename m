Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75696256F54
	for <lists+uboot-stm32@lfdr.de>; Sun, 30 Aug 2020 18:24:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ADD2C32EA3
	for <lists+uboot-stm32@lfdr.de>; Sun, 30 Aug 2020 16:24:49 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2850C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Aug 2020 16:24:46 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z4so842900wrr.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Aug 2020 09:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zBUhdMooE9nhXT/7Nlfo8qQpSMgcCO9IdSpdo3h9OxQ=;
 b=IpxLJX/cfoOa0ae09+HAIfT6clYf/4qlxYTTstzecSQpEVxA+4makb5COZpqEo0OSn
 S809a+KIT0rRk+zc3/DO9dO0w5J4MgvXGg49v58i1WHluEgu1CZoaUKC4RCb+IBf8Apa
 rkXzPmheWfFa7db7FQpiLJvug5XP7F6FlCyHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBUhdMooE9nhXT/7Nlfo8qQpSMgcCO9IdSpdo3h9OxQ=;
 b=MVPKUuWC9hbJVC8vbUyp8EcT38tT8LddniUU72lql6gh9AAhUzQcWS3XUkSaTLonfd
 C0nMQkY0tJAWc6e6K9mcB0tMREMTYShfby6T9JNOdsL2/kgtWux8TKZuMadh2QzrMUHl
 w3n2ep77Xmsn4/MH/fqZ51buLyux3CsNZJgKL4zMvP+EcJg1IOkxwB0Vrf5F/rmkfqb8
 70icrcAZfB7XTlN1eHmymTp/SBWZXXhJbQFzD9GKzhEM6aPne5Skpwfa5i9h2PO3szEF
 1lH+KL5pfFpWJW2tQOtuKKge4xCFKzdKC0POYfq2QO28qwx536XXZbjggYOdPyC7077o
 ouPg==
X-Gm-Message-State: AOAM531P0YA56ombmUX3cDuk0+LgURFpcg32GeXFPRPt4JM0QmpRhp/t
 DhXhhvAA4exO5XC+A+8oP/AndPI9gExCzXJnq0Ataw==
X-Google-Smtp-Source: ABdhPJw6Dg5TQoVslo2pyT3cblQCtlTbvM53c+Wlx+tEVHI9+OqDyBA/4kpmAwUkcSODMwDnkwumIESUOHRSeLtarKQ=
X-Received: by 2002:adf:c789:: with SMTP id l9mr8308116wrg.41.1598804685622;
 Sun, 30 Aug 2020 09:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200825134206.v3.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
 <20200825114213.5326-1-patrice.chotard@st.com>
In-Reply-To: <20200825114213.5326-1-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 30 Aug 2020 10:24:34 -0600
Message-ID: <CAPnjgZ2nC0-0RMe716NqTkY_yFK3icuUQjcBhWKVzMGvdzUUEg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/3] test: fdtdec: Add test for new
 no-map fdtdec_add_reserved_memory() parameter
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

On Tue, 25 Aug 2020 at 05:42, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> Add a test to verify that the no-map property is added in reserved-memory
> node when fdtdec_add_reserved_memory() no-map parameter is set to true.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>
> ---
>
> (no changes since v2)
>
> Changes in v2:
>    - Add no-map property test into fdtdec test
>
>  test/dm/fdtdec.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
