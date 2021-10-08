Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 425944271A3
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04D0DC5C821;
	Fri,  8 Oct 2021 19:57:12 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC48EC597B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:06 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 e16-20020a4ad250000000b002b5e1f1bc78so3225262oos.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6ypv7lSle0yrOOKVW8WLRDr2xAddUVun11WFZ4Jy/s=;
 b=Wq7FpDzf6jiW+l4jP56R6lfW275u740mkF9P0LZryzU4VqphvwHymC8wDWdjEYlN3J
 CZx5dCG7UBAzuo58+pLm+AHgR3gOWmami9vpvMeMLPY4e2U0sPLZ7IVUIJAKIIGc+yF6
 Br56JbbecQ8IEq7ZnQJm+cs9wX/6aPIEXRaOCR+D30bMDXD/mZISRgZG3viy1Qe6X5ju
 hMErTK+HtI3Cmu0MDBtIzJzMjmbencGsMo2LiRM0pEOdiUYJv6b/Vzif5p7mMjdPmYEB
 2KN8tk+A+vNgnvJk7B6hMox+g4A0W/BxvvKQyubpfAMIgvSvwyur1LY8/HHv/xgXrAA6
 +yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F6ypv7lSle0yrOOKVW8WLRDr2xAddUVun11WFZ4Jy/s=;
 b=15yQHFiDIjvGVsRpyIzJ9+tvjiETCt+mfCso5LGeKom85vchkKXr7b2blzufaonWUO
 2fYtaUSBAvcFBFLZqQOzA3KDiM6/6TUF6CnUbSdF+SrYmUgadW6t0qMZWw9V1fN/2sj3
 luNvGzZa3dtfk+Gt3mACa9k7wUSKK4kC5KCwlx9sqqm7R6RUXgoPxEZXaD9+86GReTQd
 lWPhGClYqH0fQOXSYXm3471byNFK0PxrfRdRnkDwQco4ILTh3iM+f8tUgjACRfirIN62
 gI4pbQeDhBWksmCUhsT0GCX5XvF6tN9Zhj1t0bKt94GE4oe24GQkuX4in0O9ZL/uzk0z
 t68A==
X-Gm-Message-State: AOAM532h1djH25SySWbTp6QABwTAxrQ7FMtqsdcUtW+0trJWzhvf4+n7
 ODoZj/eFUbNzcGsRdf2guyw=
X-Google-Smtp-Source: ABdhPJwqrC0Zgwy92+BIKph85Yse00dWGv0BqIR3Z3npByERDvMW5PMcmKOxPdp/VBd29i6B1bXS/Q==
X-Received: by 2002:a4a:3859:: with SMTP id o25mr5106693oof.10.1633723025663; 
 Fri, 08 Oct 2021 12:57:05 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:05 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:48 -0500
Message-Id: <20211008195655.46046-7-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 06/13] fdt_support: Implement
	fdt_ethernet_set_macaddr()
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

Oftentimes we have MAC address information stored in a ROM or OTP. The
way to add that to the FDT would be through the u-boot environment,
and then fdt_fixup_ethernet(). This is not very useful in SPL.

It would be more helpful to be able to "set interface x to MAC y".
This is where fdt_ethernet_set_macaddr() comes in. It is similar in
function to fdt_fixup_ethernet(), but only updates one interface,
without using the u-boot env, and without string processing.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 common/fdt_support.c  | 30 ++++++++++++++++++++++++++++++
 include/fdt_support.h | 17 +++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/common/fdt_support.c b/common/fdt_support.c
index 8992ac5d3f..1c43640cf7 100644
--- a/common/fdt_support.c
+++ b/common/fdt_support.c
@@ -610,6 +610,36 @@ void fdt_fixup_ethernet(void *fdt)
 	}
 }
 
+int fdt_ethernet_set_macaddr(void *fdt, int ethnum, const uint8_t *mac_addr)
+{
+	const char *path, *name;
+	int prop, aliases_node;
+	char eth_name[16] = "ethernet";
+
+	aliases_node = fdt_path_offset(fdt, "/aliases");
+	if (aliases_node < 0)
+		return aliases_node;
+
+	if (ethnum >= 0)
+		sprintf(eth_name, "ethernet%d", ethnum);
+
+	fdt_for_each_property_offset(prop, fdt, aliases_node) {
+		path = fdt_getprop_by_offset(fdt, prop, &name, NULL);
+		if (!strcmp(name, eth_name))
+			break;
+
+		path = NULL;
+	}
+
+	if (!path)
+		return -FDT_ERR_NOTFOUND;
+
+	do_fixup_by_path(fdt, path, "mac-address", mac_addr, 6, 0);
+	do_fixup_by_path(fdt, path, "local-mac-address", mac_addr, 6, 1);
+
+	return 0;
+}
+
 int fdt_record_loadable(void *blob, u32 index, const char *name,
 			uintptr_t load_addr, u32 size, uintptr_t entry_point,
 			const char *type, const char *os, const char *arch)
diff --git a/include/fdt_support.h b/include/fdt_support.h
index 72a5b90c97..8453fc8d76 100644
--- a/include/fdt_support.h
+++ b/include/fdt_support.h
@@ -119,6 +119,23 @@ static inline int fdt_fixup_memory_banks(void *blob, u64 start[], u64 size[],
 #endif
 
 void fdt_fixup_ethernet(void *fdt);
+
+/**
+ * Set the "mac-address" and "local-mac-address" of ethernet node
+ * The ethernet node is located from the "/aliases" section of the fdt. When
+ * 'ethnum' is positive, then the name is matched exactly, e.g "ethernet0".
+ * When ethnum is negative, the first ethernet alias is updated.
+ * Unlike fdt_fixup_ethernet(), this function only updates one ethernet node,
+ * and soes not use the "ethaddr" from the u-boot environment. This is useful,
+ * for example, in SPL, when the environment is not initialized or available.
+ *
+ * @param fdt		FDT blob to update
+ * @param ethnum	Ethernet device index, or negative for any ethernet
+ * @param mac_addr	Pointer to 6-byte array containing the MAC address
+ *
+ * @return 0 if ok, or -FDT_ERR_... on error
+ */
+int fdt_ethernet_set_macaddr(void *fdt, int ethnum, const uint8_t *mac_addr);
 int fdt_find_and_setprop(void *fdt, const char *node, const char *prop,
 			 const void *val, int len, int create);
 void fdt_fixup_qe_firmware(void *fdt);
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
