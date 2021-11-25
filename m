Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A0845D182
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Nov 2021 01:12:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2831AC5A4D4;
	Thu, 25 Nov 2021 00:12:09 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1B93C597BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Nov 2021 00:12:07 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id ay21so8646500uab.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Nov 2021 16:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D6LkyvR9WNQa9ZjMlCAyJhRf/Fweiq4ldP5IoyGea/E=;
 b=aUihRS8pVP4pqRgwDeBWDE6ORlqnaitsJNou2qKM2DjFMKe+XeOG5SQKrsBJmHqppJ
 iRunD35KCkUXtR4sZieftmLefeu8EqnCYHMeZOX5b08RoMJtFdVyWTpShQ6PUGUNZxq9
 P8gQFpt+TdEyE3nqwx7ibS0VL5ZyJt7yvqZmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D6LkyvR9WNQa9ZjMlCAyJhRf/Fweiq4ldP5IoyGea/E=;
 b=gokvGkLeCHRbHSxFDq88ENni2UtvOKGP57hTAjTFHpmsfCPZ25mz06MlXhmoS5Tt3v
 9uO6iPFmGZ6b+qJBBj7oCtm6dOL30O0s11Xm90DtpLEN8b1E/4OlXkODS/0Fs5tkmQqT
 lQsbyWWojIP55CHwhRaFLLY2tQIES5bThnJHNmHPi9SAhUpvJ6m9T+4/ML8PDmTUG5c3
 fCm3DZO8nr9GPPRHsEJ/PAa4xhcsLOGwRm+V5qowzNGsHDZKmomdpBwvHudkHY2R4Bxq
 1XNzRX2c0/tubaPRRBao3NeaBKFwVYPGvNrNKEPBW+u4IG6CQJ+fe8G2NJ22xwlMhp7W
 xawA==
X-Gm-Message-State: AOAM53065DoYM7e1xeWfjM7o98bSQqMutY822cSUDF0+kg5BpxGg6g5T
 sZbRVHqy+8CxI2AQzrCT22S/THBXZDVHpbVg300uuQ==
X-Google-Smtp-Source: ABdhPJyyR6MVdffTLCa27cZMt6i65ZO0eKUPYOmrP69kMx8ZrOccUSO1GF5Hm3Jqx5onLZDIVVwwTQQMVIgzB8rUV14=
X-Received: by 2002:ab0:14a7:: with SMTP id d36mr17972653uae.96.1637799126756; 
 Wed, 24 Nov 2021 16:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20211108102034.1.I5bb33aa84680ff548976f04f18cafca7ebb0ec91@changeid>
 <20211108102034.2.I275896d33cc3ef96ef439f13eda5cc6a8f9665c3@changeid>
In-Reply-To: <20211108102034.2.I275896d33cc3ef96ef439f13eda5cc6a8f9665c3@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 24 Nov 2021 17:11:54 -0700
Message-ID: <CAPnjgZ0Ri4=9Xwv-pAQJuV5cAVNVKxR6m+t5XXFvGnTbMqcKrQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Priyanka Jain <priyanka.jain@nxp.com>,
 Stefan Roese <sr@denx.de>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Subject: Re: [Uboot-stm32] [PATCH 2/2] scripts: remove CONFIG_IS_ENABLED and
	CONFIG_VAL in config_whitelist.txt
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

On Mon, 8 Nov 2021 at 02:21, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> The helper macro CONFIG_IS_ENABLED and CONFIG_VAL are not real
> configurations and they are no more present in u-boot.cfg so they can
> be removed in config_whitelist.txt.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  scripts/config_whitelist.txt | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
