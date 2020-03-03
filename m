Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F081775D2
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Mar 2020 13:22:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 278EAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Mar 2020 12:22:32 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66ADBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2020 11:44:38 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id c1so1254440oiy.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Mar 2020 03:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vik9b05VpC9BoybxwjHYI2b44frGX20V2wbmzh9S840=;
 b=d6t9dS6vF5HeWEieVscLQoPcdQhnZjS7aobez7U4h4iB4jknlGPVY1uIdX5EI/7JIO
 eqZA1a16QcPp6xdf3CL6PcpgGxjKztzhIIfkGoBRSXF3WpMpmA3VSSfEfldGyFz9a2sd
 Ljw8SOVeK7d5OGdAmAliFORegcaseFwZcjLszn21+Sy2F5uFsQF2iN89b3w4+9MqyvZ2
 YfuzejktpwT56q8INC2khtIYFx+sytUJjjXAXEAApNytU99HxxuLXsgFpOzJIoqo/x0G
 dpa1aJlaC9CTaDxh4+nUsOyyZM/7zf8nvfPR2hn0O684zoGv5QHufgSC8mjZvq2VigiX
 e26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vik9b05VpC9BoybxwjHYI2b44frGX20V2wbmzh9S840=;
 b=lG0VeRck+LUqjBhfEfBuuR8S8ARfzTiY/5pA9wxKXWOdZfkcLa7j4HbBMl8qhhEIRI
 6rIQhdpb09NUy7DaEusSeOJuYaZBijMu9yZXvc83D33FX2aYDZ+yxW9vaDpI3eDuVXYE
 2n0h0fxNm6Wh5YKZUXxNtDs4/DLNjpE4uJ1AajmPtiL6G2KZhn+BJMQURHVnus/X5LdH
 r3CYpg9038gxsMwnNvXwTSlP3QNYpYxEdaC2D2MzHO78vR9jkVeF05fZZXHhvPeG1sMj
 6Y09Lz3p3qPU9DDS3C6OxBOfvc3Bqu9pfJ4+poAeJBvQzQc5cZsL5URTfV5U5b33JE0d
 oycg==
X-Gm-Message-State: ANhLgQ0VcAjxEaeLapmO4+zHVsp20p7Fe4ap81OhAEVGnX14oOYKH9hs
 6gcDfbn0H9BmKbKI26Sd1N9fr8hl9fL0oPHmSiFMwQ==
X-Google-Smtp-Source: ADFU+vtajlUvf6EEOFVODblajGBequmND0AsdOeDIvj8A01B8o/3KUeyxhiqD4wwAk7ggg9Q8ZwGFOlEPSBrnQmrGgU=
X-Received: by 2002:a54:4098:: with SMTP id i24mr2201759oii.149.1583235877141; 
 Tue, 03 Mar 2020 03:44:37 -0800 (PST)
MIME-Version: 1.0
References: <20200302122153.20670-1-patrick.delaunay@st.com>
In-Reply-To: <20200302122153.20670-1-patrick.delaunay@st.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 3 Mar 2020 12:44:26 +0100
Message-ID: <CAHUa44F61geQiszoEovwpLaK09GC4M_95be_tabbn5gqe5Gddg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
X-Mailman-Approved-At: Tue, 03 Mar 2020 12:22:30 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] tee: optee: use dev_info in
	print_os_revision
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

On Mon, Mar 2, 2020 at 1:22 PM Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Display TEE version at information level; this patch replaces
> debug() call to dev_info() in print_os_revision() function.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/tee/optee/core.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Acked-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
